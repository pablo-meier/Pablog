'use strict';

angular.module('iama', [])

.value("$backend_url", "http://iama.morepaul.com")

// Pretty much does everything for the widget.
.controller('IamaCtrl', function($scope, $http, $log, $backend_url) {

    // Initialize the scope's data

    // Photos on display.
    // :: (or/c { full_url : String, short_url : String, date : Date }
    //          undefined)
    $scope.current = undefined;
    $scope.next = undefined;
    $scope.prev = undefined;
    // The full timeline.
    // :: [{ full_url : String, short_url : String, date : Date }]
    var timeline = undefined;
    // index :: int
    var index = undefined;
    // firstImage :: Date
    var firstImage = undefined;
    // lastImage :: Date
    var lastImage = undefined;

    var errorFromRest = function(name) {
        return function(data, status, headers, config) {
            $log.error("ERROR: In method \"" + name + "\", returned headers: " + 
                headers + "\nstatus: " + status + "\ndata: " + data);
        };
    };

    var assignAdjacents = function() {
        if (index < (timeline.length - 1)) {
            $scope.next = timeline[index + 1];
        }
        else {
            $scope.next = undefined;
        }
        if (index > 0) {
            $scope.prev = timeline[index - 1];
        }
        else {
            $scope.prev = undefined;
        }
    }



    $http.get($backend_url + "/get-timeline")
        .success(function(data, status, headers, config) {
            // Set the timeline
            var json_timeline = data.timeline;
            timeline = [];

            for (var i = 0; i < json_timeline.length; i++) {
                var curr = json_timeline[i];
                var obj = {
                    full_url : curr.image_source_full,
                    small_url : curr.image_source,
                    date : new Date(curr.image_date)
                };
                timeline[i] = obj;
            }

            // Set the current.
            var length = timeline.length;
            index = length - 1;
            $scope.current = timeline[index];

            assignAdjacents();

            // Set first and last image.
            firstImage = timeline[0].date;
            lastImage = timeline[length - 1].date;
        })
        .error(errorFromRest("/get-timeline"));

    $scope.previousPicture = function() {
        if (index > 0) {
            index -= 1;
            $scope.current = timeline[index];
            assignAdjacents();
        }
    };

    $scope.nextPicture = function() {
        if (index < (timeline.length - 1)) {
            index += 1;
            $scope.current = timeline[index];
            assignAdjacents();
        }
    };

    $scope.isAtLastPicture = function() {
        if ($scope.current.date !== undefined && lastImage !== undefined) {
            return $scope.current.date.getTime() === lastImage.getTime();
        } else {
            // Opt for safety and disable the button.
            return true;
        }
    };

    $scope.isAtFirstPicture = function() {
        if ($scope.current.date !== undefined && firstImage !== undefined) {
            return $scope.current.date.getTime() === firstImage.getTime();
        } else {
            // Opt for safety and disable the button.
            return true;
        }
    };

    // For testing, mostly.
    $scope.setIndex = function(indx) {
        index = indx;
        $scope.current = timeline[index];
    };
});

