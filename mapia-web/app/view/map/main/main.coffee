angular.module('Mapia')
.controller 'MapMainCtrl', ($scope, $log, $timeout) ->

  $scope.map =
    center:
      latitude: 37.550131
      longitude: 126.977877
    zoom: 4

  $scope.mylat = "36.99059819567056"
  $scope.mylon =  "127.76889262500003"

  $scope.options = scrollwheel: true
  $scope.coordsUpdates = 0
  $scope.dynamicMoveCtr = 0

  $scope.marker =
    id: 0
    coords:
      latitude: 40.1451
      longitude: -99.6680
    options: draggable: true
    events: dragend: (marker, eventName, args) ->

      console.log 'marker dragend'

      lat = marker.getPosition().lat()
      lon = marker.getPosition().lng()
      $log.log lat
      $log.log lon
      $scope.marker.options =
        draggable: true
        labelContent: 'lat: ' + $scope.marker.coords.latitude + ' ' + 'lon: ' + $scope.marker.coords.longitude
        labelAnchor: '100 0'
        labelClass: 'marker-labels'



      $scope.mylat =
        $scope.marker.coords.latitude

      $scope.mylon =
        $scope.marker.coords.longitude

      $scope.myname =
        'Paul'

      getReverseGeocode($scope.mylat, $scope.mylon)

      return


  getReverseGeocode = (lat, lng) ->
    geocoder = new google.maps.Geocoder();
    latlng = new google.maps.LatLng(lat, lng);

    geocoder.geocode { 'latLng': latlng }, (results, status) ->

      if (status == google.maps.GeocoderStatus.OK)
        if (results[1])
          $log.log results[1]




  $scope.$watchCollection 'marker.coords', (newVal, oldVal) ->
    if _.isEqual(newVal, oldVal)
      return
    $scope.coordsUpdates++
    return
  $timeout (->
    $scope.marker.coords =
      latitude: 42.1451
      longitude: -100.6680
    $scope.dynamicMoveCtr++
    $timeout (->
      $scope.marker.coords =
        latitude: 37.550131
        longitude: 126.977877
      $scope.dynamicMoveCtr++
      return
    ), 2000
    return
  ), 1000
  return
