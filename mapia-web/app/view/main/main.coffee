
angular.module('Mapia')
.controller 'MainCtrl', ($scope) ->

  vm = this

<<<<<<< HEAD
  this.name = "Main Bruce"
=======
  activate = ->
    $scope.map =
      center: { latitude: 45, longitude: -73 }
      zoom: 8


  activate()
>>>>>>> a988593aa30f1032cb433125385b1c21ace7fff3

  return