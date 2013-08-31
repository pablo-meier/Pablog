    Title: PAUL IS BOTHERED
    Date:2010-05-09T18:12:00
    Tags: pablolife

You can talk all you want about 'practicality,' but one way in which I see
functional languages will ALWAYS beat imperative is the built-in love of
lists. I simply can't express my distaste for always writing:


{% codeblock lang:java %}
    import java.util.Collection;
    import java.util.Iterator;

    // crap elided

    Iterator<String> iterator = myCollection.iterator();

    while (iterator.hasNext()) {
        doSomethingWithString(iterator.next());
    }
{% endcodeblock %}

over, say:

{% codeblock lang:scheme %}
    (map do-something-with-string my-collection)
{% endcodeblock %}

_But Paul!_ says you, _Java gives you static typing! The Scheme example above
doesn't, so it can get away with that kind of dynamic-language brevity!_ Well,
so does Haskell:

{% codeblock lang:haskell %}
    map doSomethingWithString myCollection
{% endcodeblock %}

and SML:

    map(doSomethingWithString)(myCollection)

For fun, lets just see it in a smattering of other languages I've used. Ruby:

{% codeblock lang:ruby %}
    my_collection.each { |x| do_something_with_string x }
{% endcodeblock %}

Erlang:

{% codeblock lang:erlang %}
    lists:foreach(fun do_something_with_string/1, MyCollection),
{% endcodeblock %}

Common Lisp:

{% codeblock lang:cl %}
    (mapcar #'do-something-with-string my-collection)
{% endcodeblock %}

Naturally, this isn't even the whole picture. The example assumes you're
iterating for side effects; if you needed the list with its elements
transformed, that would be another 5-7 lines of Java. And the list can only
exist because it was constructed to begin with, which if you did it in another
class, requires 3-6 more import declarations there.

I know its trendy to hate on Java, and I've mentioned before that [PL hating
like this is unproductive][1]. Still, _we use and work with variable-sized
lists all the time_, and what functional designers figured out (long, long
ago) is that it's quite nice to have them built-in.


Bleh, sorry. Android programming is fun, _despite_ the Java.

I did say "imperative" above, not just Java. Kind of a misnomer, as CL and
Ruby, above, provide one-line map and are arguably imperative. In that case, I
let my biases shine through and used "imperative" interchangeably with
"luddite." But let's never forget our buddy C++:

{% codeblock lang:cpp %}
    #include <list>
    using namespace std;

    list<string>::iterator iter;

    for (iter = my_collection->begin(); iter != my_collection->end(); ++iter) {
        do_something_with_string(*iter);
    }
{% endcodeblock %}

**PUKE**


   [1]: http://www.morepaul.com/2010/03/on-how-knowledge-turns-to-snobbery.html
