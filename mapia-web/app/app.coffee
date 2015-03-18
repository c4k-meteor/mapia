
angular.module 'Mapia', [
  'ui.router'
  'uiGmapgoogle-maps'
  'CuzMainCtrl'
]

.config ($urlRouterProvider, $stateProvider) ->

  $urlRouterProvider.otherwise '/map'

  $stateProvider

  .state 'coderun',
    url: '/coderun'
    templateUrl: 'view/coderun/coderun.html'

  .state 'main',
    url: '/main'
    templateUrl: 'view/main/main.html'
    controller: 'MainCtrl'
    controllerAs: 'main'

  .state 'map',
    url: '/map'
    templateUrl: 'view/map/main/main.html'
    controller:'MapMainCtrl'

  .state 'cuzco',
    url: '/cuzco'
    templateUrl: 'view/cuzco/main/main.html'
    controller:'CuzMainCtrl'



  return