angular.module('Mapia')
.controller 'MapMainCtrl', ($scope, $log, $timeout) ->


  $scope.map =
    center:
      latitude: 37.491407  ##starting point
      longitude: 126.92421
    zoom: 17

  $scope.mylat = "37.491407706514956"
  $scope.mylon =  "126.92421136203006"

  # 37.549348440202756 //후암로
  # 126.97847781481937


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
        if (results[0])
          $log.log results[0].formatted_address
          $scope.mycoordi = results[0].formatted_address

          # address_components
          # formatted_address




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
        latitude: 37.491407  ##marker
        longitude: 126.92421
      $scope.dynamicMoveCtr++
      return
    ), 2000
    return
  ), 1000
  return
