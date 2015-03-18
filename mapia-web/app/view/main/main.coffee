
angular.module('Mapia')
.controller 'MainCtrl', ($scope) ->

  $scope.map = {}
  $scope.marker = {}


  ##############################
  activate = ->
    initBaseMap()
    initMarker()
  ##############################



  # FUNCTIONS...
  initBaseMap = ->
    $scope.map =
      center: { latitude: 45, longitude: -73 }
      zoom: 8
      options:
        scrollwheel: true
      events:
        click: onClick
        bounds_changed: onBoundsChanged

  initMarker = ->
    $scope.marker =
      randomMarkers: [
        {
          id: 0
          latitude: 45,
          longitude: -73,
          title: 'Marker Title'
        }
      ]
      events:
        click: onMarkerClick




  # EVENTS
  onClick = (mapModel, eventName, originalEventArgs) ->
    console.log "onClick()"
    console.log "mapModel:", mapModel
    console.log "eventName:", eventName
    console.log "originalEventArgs:", originalEventArgs

  onBoundsChanged = (mapModel, eventName, originalEventArgs) ->
    console.log "onBoundsChanged()"
    console.log "mapModel:", mapModel
    console.log "eventName:", eventName
    console.log "originalEventArgs:", originalEventArgs

  onMarkerClick = (mapModel, eventName, originalEventArgs) ->
    console.log "onMarkerClick onClick()"
    console.log "mapModel:", mapModel
    console.log "eventName:", eventName
    console.log "originalEventArgs:", originalEventArgs



  ##############################
  activate()
  ##############################
  return