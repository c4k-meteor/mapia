angular.module('Mapia')
.directive 'reverseGeocode', () ->

  return {

    restrict: 'E',
    template: '<div></div>',
    replace: true
    scope: {
      lat: "=",
      lng: "="
    },
    link: (scope, element) ->

      scope.$watch 'lat', ->
        geocoder = new google.maps.Geocoder();
        latlng = new google.maps.LatLng(scope.lat, scope.lng);

        geocoder.geocode { 'latLng': latlng }, (results, status) ->

          if (status == google.maps.GeocoderStatus.OK)
            if (results[1])
              element.text(results[1].formatted_address)
            else
              element.text('Location not found')
          else
            element.text('Geocoder failed due to: ' + status)

  }

