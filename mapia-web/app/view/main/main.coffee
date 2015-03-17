
angular.module('Mapia')
.controller 'MainCtrl', ($scope) ->

  activate = ->
    $scope.map =
      center: { latitude: 45, longitude: -73 }
      zoom: 8


  activate()

  return