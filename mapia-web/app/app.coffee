
angular.module 'Mapia', [
  'ui.router'
  'uiGmapgoogle-maps'
]

.config ($urlRouterProvider, $stateProvider) ->

  $urlRouterProvider.otherwise '/main'

  $stateProvider

  .state 'coderun',
    url: '/coderun'
    templateUrl: 'view/coderun/coderun.html'

  .state 'main',
    url: '/main'
    templateUrl: 'view/main/main.html'
    controller: 'MainCtrl'
    controllerAs: 'main'


  return