/*
 * Bootstraps Angular into window.document node.
 */

define(['require',
        'angular',
        'iama/iama-widget'
], function(require, angular) {
    'use strict';

    require(['domReady!'], function(document) {
        angular.bootstrap(document, ['iama-widget']);
    });
});

