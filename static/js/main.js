"use strict";

// First experiments with RequireJS

requirejs.config({
    baseUrl : "js/lib",

    paths: {
        domReady : "./domReady/domReady"
    },

    shim: {
        bootstrap : {
            deps: ["jquery"],
            exports: "$"
        }
    },

    deps: ['./angular-manual-bootstrap']
});
