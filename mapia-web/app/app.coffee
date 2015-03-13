
angular.module 'Mapia', [
  'ui.router'
]

.config ($urlRouterProvider, $stateProvider) ->

  $urlRouterProvider.otherwise '/main'

  $stateProvider

  .state 'hello',
    url: '/hello'
    templateUrl: 'view/hello/hello.html'
    controller: 'HelloCtrl'
    controllerAs: 'hello'

  .state 'coderun',
    url: '/coderun'
    templateUrl: 'view/coderun/coderun.html'

  .state 'main',
    url: '/main'
    templateUrl: 'view/main/main.html'
    controller: 'MainCtrl'
    controllerAs: 'main'


  return