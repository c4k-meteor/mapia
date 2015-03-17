
angular.module('Mapia')
.controller 'MapMainCtrl', ($scope) ->

  $scope.map =
    center: { latitude: 45, longitude: -73 }
    zoom: 8

