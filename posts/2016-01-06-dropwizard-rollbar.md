    Title: Augmenting Dropwizard with Swagger and Rollbar
    Date: 2016-01-06T12:00:00
    Tags: engineering, pablolife

_The following is a cross-post with the [Reonomy blog][13]. It was made to soar
and look good there, but figured I'd put it here since it's still my writing._ 😛

_These days, we do things a bit differently in the company, as do I personally.
I use [Kotlin][14] with Dropwizard and a host of slightly different techniques
than in the example project. Nonetheless, hope it's helpful to someone!_

---

Hi Comrades! I'm Pablo 😄

I was responsible for writing the server layer for a new product under a tight
deadline. I ended up writing it in Java with [Dropwizard][1], and thought I'd
share where I hit a pitfall or two in implementing the server to have certain
features not specific to the domain logic of our app.

If you're considering implementing your next REST service with a **powered-up**
deployment of Dropwizard, read on!

**(follow along with the [example project][15] demonstrating these integrations!)**

![](https://reonomy-monona-prd.s3.amazonaws.com/2015/Dec/mbuster-1450889331657.gif)

<!-- read more -->

### Requirements of the server

Beyond fulfilling the needs of the customers, my design goals from an
engineering perspective were these:

1. Work with stack with which I can move quickly enough to hit this deadline!

2. Implement it such that other engineers who _aren't me_ can maintain it with
   an acceptably low number of [wtfs per minute][3].

3. Have the server integrate with [Swagger][4] such that users of my server can
  easily see which endpoints are served, what their parameters are, and what the
  potential responses are without having to dig into the source. See an example
  of a Swagger-documented service in action with their
  [petstore example](http://petstore.swagger.io/).

4. Have the server integrate well with other services we're using, like
   [Rollbar][5].

5. Enforce certain constraints that I believe make for better software, like
  minimization of null values or defaulting to immutability.

6. Have reasonable performance characteristics, for some definition of
  "reasonable."

7. Establish a groundwork for a product that is easy to measure, monitor, and
  deploy.

#### For 1 & 2, I chose Java

![](https://reonomy-monona-prd.s3.amazonaws.com/2015/Dec/rush-1450889733731.png)

I know, Java is what boring kids use. Java was what the Rails crowd positioned
themselves against to be _awesome_ and make cool apps and things. 

But I know it well, and am confident I can use it to build a server that fits
the requirements above. It has solid performance characteristics compared to
many "cooler" dynamic languages, and the realities of maintaining Java have made
it a less unpleasant experience than many Cool stacks in my limited experience
doing that. At a previous job I was tasked with a large-scale refactor on a
~280,000 line C++ project, and yet another previous experience had me refactor
of a 6,000 line Python project. The C++ gig was much easier, _mostly_ due to
just being better engineered, but a significant amount is due to static types
and good IDE support. If I'm thinking of my successors having to maintain this,
I hope they get assistance in understanding the codebase and the program's
semantics from this tool called a "computer."

(Not to knock too hard on up-and-coming languages: I _actually completed_ this
server while learning [Elixir][16]! Then I woke up, as I
always do, a sad and broken human.)

And hey, Facebook and Etsy were built on _PHP_, so sweating too hard on
language/stack choices eventually becomes a void proposition.

#### For 6 & 7, I chose Dropwizard

![](https://reonomy-monona-prd.s3.amazonaws.com/2015/Dec/MegaManEightBit-1450889746811.png)

I came across Dropwizard through this [marvelous series of blog posts][6], and
when I tried it in pet projects, it impressed me. Built-in use of libraries that
are "must-have" drop-ins like [Joda-Time][7] and [Guava][8], out-of-the-box
support for [healthchecks][17] and [metrics][18], centralized configuration,
while also still giving you the flexibility to do things your own way. This
wasn't a do-everything-for-you framework, nor a
we-serve-endpoints-and-nothing-else microframework.

#### For 3, 4, and 5…

And here's the meat! Out of the box, Dropwizard requires some configuration if
you'd like to integrate Rollbar or Swagger. And _those_ tools may not always
play well if you're using certain Dropwizard features, like [Auth-gated
endpoints][9].

I'll go over our Swagger integration, our Rollbar integration, and making sure
your JSON models are consistent if you're using [Retrofit][19].

#### Swagger, or Love You Some Annotations

![](https://reonomy-monona-prd.s3.amazonaws.com/2015/Dec/toadman_intro-1450889783384.gif)

There's a lot to making your endpoints play well with Swagger. I'll go through
the following here:

* Initial hooking up of libraries and setting up your [Resources][20] and [Representations][21].
* Allowing these to work with [Dropwizard Auth][22].
* Allowing the server to self-serve its documents using [Swagger UI][23].

##### Hooking it up

You'll want to add the following to your `build.gradle`:

```
compile ('io.swagger:swagger-jersey2-jaxrs:1.5.3') {
    exclude group: 'org.glassfish.jersey.core', module: 'jersey-common'
    exclude group: 'org.glassfish.jersey.core', module: 'jersey-server'
    exclude group: 'org.glassfish.jersey.core', module: 'jersey-client'
    exclude group: 'org.glassfish.jersey.containers', module: 'jersey-container-servlet-core'
}
compile ('io.swagger:swagger-jaxrs:1.5.3') {
    exclude group: 'javax.ws.rs', module: 'jsr311-api'
}
compile ('io.swagger:swagger-annotations:1.5.3') {
   exclude group: 'io.swagger', module: 'swagger-parser'
}
```

That's a lot of exclusions! Turns out many of the Swagger libraries can cause
version conflicts with many of Dropwizard's dependencies, and can give you
[ClassNotFoundExceptions][24] or [NoSuchMethodExceptions][25] if the JVM loads
the libraries in the wrong order at runtime. Java, amirite?

Once you have this, we can begin the heinous-looking but labor-saving
Annotation-based programming of your Resources. For example, here is merely the
_method declaration_ for an endpoint:

```
@Timed
@PUT
@Path("/{id}")
@Consumes(MediaType.APPLICATION_JSON)
@ApiOperation(
    value = "Alters an existing X and returns the new, updated version.",
    response = Resource.class
)
@ApiResponses(value = {
    @ApiResponse(code = 404, message = "Resource ID not found"),
    @ApiResponse(code = 400, message = "Invalid resource spec")
})
public Response updateResource(
   @Auth AuthedUser user,
   @ApiParam(value = "Resource ID", required = true) @PathParam("id") UUID id,
   @ApiParam(value = "JSON object with the resource params", required = true) ResourceParameters newParams,
   @ApiParam(value = "Page number", required = false, defaultValue = "1") @QueryParam("page") Integer pageNumber,
   @ApiParam(value = "Page size", required = false, defaultValue = "20") @QueryParam("pageSize") Integer pageSize
) {
```

This looks _mighty gross_, so lets go over what you're getting here:

* `@Timed` tells Dropwizard's metrics to store timing information on this
  endpoint.
* `@PUT`, `@Path`, and `@Consumes` are your working-group annotations for REST
  services.
* `@ApiOperation` is where we first encounter Swagger annotations. This lets us
  provide documentation to our users regarding the intentions of this endpoint.
* `@ApiResponses` allow us to document our non-200 responses for when things
  fail.
* Finally, we annotate our parameters with `@ApiParam`. Note that we _also_ need
  the `javax.ws.rs` parameters like `@QueryParam`!

Data models are a fair bit easier:

```
@ApiModel(value = "MyModel")
public class MyModel {
    @ApiModelProperty(value = "The value stored by this model", required = false, name = "my_value")
    private Optional<String> myValue;

    // Repeat for the various fields…
}
```

Once your resources and models are hooked up, add the following to you toplevel
`run` method:

```
env.jersey().register(ApiListingResourceJSON.class);
env.jersey().register(SwaggerSerializers.class);
ScannerFactory.setScanner(new DefaultJaxrsScanner());
```

Once this is set up, start up your server and navigate to
`<toplevel>/swagger.json`. You should see a Swagger document with your values
populated!

##### Working with @Auth

I later ran into a bug where the `@Auth` param was getting recorded in the
Swagger documentation, suggesting to clients that my endpoints _all_ required
data they couldn't have a hope of providing. It turns out we need to instruct
Swagger to ignore those parameters when scanning, but how?

Turns out we have to extend and register [SwaggerSpecFilter][26]. I worked off
of [this StackOverflow][27] answer to build this class, which contains a lot of
throat-clearing, but not a whole lot of functionality:

```
public class AuthParamFilter implements SwaggerSpecFilter {
    @Override
    public boolean isOperationAllowed(
            Operation operation,
            ApiDescription api,
            Map<String, List<String>> params,
            Map<String, String> cookies,
            Map<String, List<String>> headers) {
        return true;
    }

    @Override
    public boolean isParamAllowed(
            Parameter parameter,
            Operation operation,
            ApiDescription api,
            Map<String, List<String>> params,
            Map<String, String> cookies, Map<String,
            List<String>> headers) {
        String access = parameter.getAccess();
        if (access != null && access.equals("internal")) return false;
        return true;
    }

    @Override
    public boolean isPropertyAllowed(
            Model model,
            Property property,
            String propertyName,
            Map<String, List<String>> params,
            Map<String, String> cookies,
            Map<String, List<String>> headers) {
        return true;
    }
}
```

All it does is check the "access" value of a parameter annotation, and choose to
ignore it if the value is "internal."

So if we go back to our resource definition, note the addition of `access =
internal`:

```
@ApiResponses(value = {
    @ApiResponse(code = 404, message = "Resource ID not found"),
    @ApiResponse(code = 400, message = "Invalid resource spec")
})
public Response updateResource(
   @ApiParam(access = "internal") @Auth AuthedUser user,
   @ApiParam(value = "Resource ID", required = true) @PathParam("id") UUID id,
   @ApiParam(value = "JSON object with the resource params", required = true) ResourceParameters newParams,
  // ellided
```

Finally, we can register this in the `run` method, with our other Swagger
registrations:

```
FilterFactory.setFilter(new AuthParamFilter());
```

_Voila!_ The @Auth parameters (and anything else you mark as `access =
"internal"`) ceases to exist to the outside world!

![](https://reonomy-monona-prd.s3.amazonaws.com/2015/Dec/toadman_weapon_get-1450889862478.gif)

##### Serving it up

This last bit is likely the most hackey: using Swagger UI to self-serve our
docs. We'll likely move to a model where our docs are served by a dedicated
instance reading specs from our services rather than have the services serve
themselves, but until we get there, this is a decent way to make the docs
available to any clients who need them.

To do this:

* Clone [Swagger UI][28] and copy its `dist` directory in `src/main/resources`. Its got no dependencies!
* Serve it statically using [AssetsBundle][29]. I found [this tutorial][30]
  instructive, along with the docs + source. The relevant lines from our
  `initialize` method in the toplevel service class is:

```
if (!isProduction()) {
    bootstrap.addBundle(new AssetsBundle("/swagger-ui", "/api-docs", "index.html"));
}

```

* Point Swagger UI to read the spec from our server. Go into the Swagger UI
  codebase you just cloned and open `index.html`. [By default it will point to
  the petstore example][31], but you can change this to the point to the doc
  your server generates itself by changing it to `"/swagger.json"`.

Now your clients can get pretty documentation and an API playground! Of course,
now _you_ have to maintain and update the local Swagger UI yourself, remember
that bespoke change, and checking this in messes with your repo's statistics:

![Now we're a JavaScript Project!](https://reonomy-monona-prd.s3.amazonaws.com/2015/Dec/Screen_Shot_2015_12_20_at_5_24_35_PM-1450652482823.png)
<p style="text-align:center; font-style: italic; font-size: small">Now we're a JavaScript project!</p>

But now it's done and you can improve it later. And what is engineering but a
set of compromises that makes you cry?

#### Rollbar, a story of appenders and design choices

![](https://reonomy-monona-prd.s3.amazonaws.com/2015/Dec/pharoahman_intro-1450890803670.gif)

We use [Rollbar][32] to monitor errors in our company's applications, and wanted
this product to fall in line with that. And they have [Java integrations][33]!
Look at that! One of them works with [Logback][34], one of the technologies
Dropwizard ships with! This should be easy!

Alas, poor Yorick, it was a bit of a bear. The issue, succinctly:

 * Most Logback integrations are done with an XML config file, called
   logback.xml, including the recommended [rollbar-logback][35].

 * Dropwizard, however, tries to centralize configuration. Rather than have
   Jersey's web.xml, Logback's logback.xml, and a whole zoo for every tool, you
   have [Dropwizard Configuration][36].  On one hand, centralized! On another,
   you have to jiggle a fair number of wires to get "standard" additions for any
   of these tools.

 * This appears to be a [topic][37] of [some contention][38].

Luckily, the linked threads, and [this][39], illuminate a way forward: you need
to write a custom wrapper class, then add a file to META-INF in
`src/main/resources` as well as a few configuration variables.

So here's the `build.gradle` dependency addition:

```
compile 'com.tapstream:rollbar-logback:0.1'
```

Here is literally the entire class we wrote, based on the linked Gist:

```
@JsonTypeName("rollbar")
public class RollbarAppenderFactory extends AbstractAppenderFactory {

    @NotNull private String environment = "development";
    private String apiKey;

    @JsonProperty
    public void setEnvironment(String environment) {
        this.environment = environment;
    }

    @JsonProperty
    public void setApiKey(String apiKey) {
        this.apiKey = apiKey;
    }

    @JsonProperty public String getEnvironment() { return environment; }
    @JsonProperty public String getApiKey() { return apiKey; }

    @Override
    public Appender<ILoggingEvent> build(LoggerContext context, String applicationName, Layout<ILoggingEvent> layout) {
        final RollbarAppender appender = new RollbarAppender();
        appender.setApiKey(apiKey);
        appender.setEnvironment(environment);
        appender.setContext(context);
        addThresholdFilter(appender, threshold);
        appender.start();
        return wrapAsync(appender);
    }
}
```

You then have to include a specific file
`src/main/resources/META-INF/services/io.dropwizard.logging.AppenderFactory`
with this line: `package.path.to.class.RollbarAppenderFactory` for the JVM to
register the class magically.

And _finally_, include the needed variables in your YAML config file:

```
logging:
    # logging settings as you like
    appenders:
        - type: rollbar
          apiKey: ${AQUIFER_ROLLBAR_TOKEN}
          environment: ${ENVIRONMENT}
          threshold: ERROR
```

#### JSON, and MORE

![](https://reonomy-monona-prd.s3.amazonaws.com/2015/Dec/pharoahman_weapon_get-1450889922618.gif)


We use Retrofit to create HTTP clients for internal and external services that
provide that API (as well as a client for our own services in integration
tests). Retrofit 1.9.x used to rely on [Gson][40] by default for its JSON
processing, though it looks like in the current 2.0 beta they make you
explicitly plug in your provider.

Dropwizard uses [Jackson][41], so make your life a lot easier by **configuring
Retrofit (or any other JSON consumer) to use Jackson when possible, and share
logic for any [ObjectMappers][42] you use.**

For example, in our app:

* Guava constructs (such as `Optional<T>` should be honored: an
  `Optional.of("value")` should render to `"field": "value"` rather than the
  default behavior, `"field": "Optional.of(\"value\")"`

* Fields with null values should _not_ be present in JSON objects (as opposed to
  `"field": null`)

* Joda-Time [DateTime][43] objects should be written in ISO8601 format rather
  than timestamps (by default, Dropwizard was returning us `"created_at":
  1450620111` instead of `"created_at": 2015-12-20T14:01:51+00:00`.

To enable this: add a few lines to `build.gradle`:

```
dependencies {
    compile 'com.squareup.retrofit:converter-jackson:1.9.0' 
    compile 'com.fasterxml.jackson.datatype:jackson-datatype-guava:2.6.2'
    compile 'com.fasterxml.jackson.datatype:jackson-datatype-joda:2.6.1'
}

```


Centralize your Object Mapper configuration logic. We use a static method, which
can be fraught if abused but we're only doing it here, really:

```
public static ObjectMapper configureObjectMapper(ObjectMapper mapper) {
    mapper.registerModule(new GuavaModule())
        .configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false)
        .setSerializationInclusion(JsonInclude.Include.NON_ABSENT);
    return mapper;
}
```

Then in our toplevel app's `run` method:

```
public void run(AquiferConfiguration cfg, Environment env) throws ClassNotFoundException, IOException {
    ObjectMapper mapper = AppModule.configureObjectMapper(env.getObjectMapper());
    // Pass the ObjectMapper to whomever needs it…
}
```

Meanwhile, in your Retrofit RestAdapter.Builder, you can configure it to use
Jackson + your Mapper like so:

```
// `mapper` is injected or configured per above
new RestAdapter.Builder()
    .setEndpoint("my.endpoint.com")
    .setConverter(new JacksonConverter(mapper))
```

### Still to come!

There are a number of other integrations/properties that I've included or would
like to include that didn't make it in time for this blog post:

* [Comsat][10] integration, allowing us to have lighter threads so our
  synchronous programming style pains us less.

* [RxJava][11] for async tasks that we'd like to perform during an endpoint but
  not cause any blocking at all (i.e. user activity logging).

* Self-serving Javadocs! While Swagger is serving the public API provided by our
  server, _internal_ documentation for the code and the design choices can be
  generated with `gradle javadoc`; it'd be great to have the server host those
  itself too.

* Not the server _proper_, but another project would be to include a
  [Dashing][12] project that hits the Metrics endpoint and/or our datastores and
  provides a high-level view of the project and its activity.

![](https://reonomy-monona-prd.s3.amazonaws.com/2015/Dec/warp_out-1450890150449.gif)

<div style="text-align:center"><small><em>(gifs taken by <a href="https://www.youtube.com/watch?v=NiEpni0s1no">this Let's Play of Mega Man 4</a>.)</em></small></div>

   [1]: http://www.dropwizard.io/
   [2]: https://modelviewculture.com/pieces/hacker-mythologies-and-mismanagement
   [3]: https://s-media-cache-ak0.pinimg.com/736x/27/69/8a/27698a48b044a7f8d46ccb4e5974d38d.jpg
   [4]: http://swagger.io/
   [5]: https://rollbar.com
   [6]: http://blog.paralleluniverse.co/2014/05/01/modern-java/
   [7]: http://www.joda.org/joda-time/
   [8]: https://code.google.com/p/guava-libraries/
   [9]: http://www.dropwizard.io/0.9.0/docs/manual/auth.html
   [10]: http://docs.paralleluniverse.co/comsat/
   [11]: https://github.com/ReactiveX/RxJava
   [12]: http://dashing.io/
   [13]: https://www.reonomy.com/augmenting-dropwizard-with-swagger/
   [14]: https://kotlinlang.org/
   [15]: https://github.com/reonomy/dropwizard-megaman
   [16]: http://elixir-lang.org/
   [17]: http://www.dropwizard.io/0.9.1/docs/manual/core.html#health-checks
   [18]: https://dropwizard.github.io/metrics/3.1.0/
   [19]: http://square.github.io/retrofit/
   [20]: http://www.dropwizard.io/0.9.1/docs/manual/core.html#resources
   [21]: http://www.dropwizard.io/0.9.1/docs/manual/core.html#man-core-representations
   [22]: http://www.dropwizard.io/0.9.1/docs/manual/auth.html
   [23]: https://github.com/swagger-api/swagger-ui
   [24]: https://docs.oracle.com/javase/7/docs/api/java/lang/ClassNotFoundException.html
   [25]: https://docs.oracle.com/javase/7/docs/api/java/lang/NoSuchMethodException.html
   [26]: https://github.com/swagger-api/swagger-core/blob/066b2f7ee6ca6cc5ba7b0b07f485aa1eddbdaf7e/modules/swagger-core/src/main/java/io/swagger/core/filter/SwaggerSpecFilter.java
   [27]: http://stackoverflow.com/questions/21911166/how-can-i-set-swagger-to-ignore-suspended-asyncresponse-in-asynchronous-jax-rs
   [28]: https://github.com/swagger-api/swagger-ui
   [29]: http://www.dropwizard.io/0.9.1/dropwizard-assets/apidocs/io/dropwizard/assets/AssetsBundle.html
   [30]: http://spin.atomicobject.com/2014/10/11/serving-static-assets-with-dropwizard/
   [31]: https://github.com/swagger-api/swagger-ui/blob/60848bb4e2bbaae84c15f42059ee9544417003a9/dist/index.html#L38
   [32]: https://rollbar.com/
   [33]: https://rollbar.com/docs/items_other/
   [34]: http://logback.qos.ch/
   [35]: https://github.com/tapstream/rollbar-logback
   [36]: https://dropwizard.github.io/dropwizard/manual/core.html#configuration
   [37]: https://groups.google.com/forum/#!topic/dropwizard-user/q46TA56CmZk
   [38]: https://github.com/dropwizard/dropwizard/pull/567
   [39]: https://gist.github.com/russgray/120ed9c4972df6526353
   [40]: https://github.com/google/gson
   [41]: https://github.com/FasterXML/jackson
   [42]: https://fasterxml.github.io/jackson-databind/javadoc/2.5/com/fasterxml/jackson/databind/ObjectMapper.html
   [43]: http://joda-time.sourceforge.net/apidocs/org/joda/time/DateTime.html
