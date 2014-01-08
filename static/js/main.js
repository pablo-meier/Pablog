"use strict";

// First experiments with RequireJS
// most of this taken from here: http://www.startersquad.com/blog/angularjs-requirejs/

requirejs.config({
    baseUrl : "js/lib",

    paths: {
        iama: "../../iama/js",
        domReady : "./domReady/domReady"
    },

    shim: {
        angular : {
            exports: 'angular'
        },
        bootstrap : {
            deps: ["jquery"],
            exports: "$"
        }
    },

    deps: ['./angular-manual-bootstrap']
});
