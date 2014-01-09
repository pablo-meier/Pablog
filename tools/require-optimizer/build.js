({
    appDir: "../../static",
    baseUrl: "./js/lib",
    mainConfigFile: "../../static/js/main.js",
    dir: "../../build",
    name: "../main",

    optimize: "uglify2",
    uglify2: {
        mangle : false
    },
    optimizeCss: "standard",
    findNestedDependencies: true
})
