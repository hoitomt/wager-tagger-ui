# FastClick.attach(document.body)

window.addEventListener 'load', ->
    FastClick.attach(document.body);
, false

if window.location.hostname is "localhost"
  API_SERVER = "http://localhost:4001"
  API_SERVER_SYNC = "http://localhost:3000/api/v1"
else
  API_SERVER = "http://wager-tagger-go-api.herokuapp.com"
  API_SERVER_SYNC = "http://wager-tagger-api.herokuapp.com/api/v1"

app = angular.module "wagerTagger", ['ticketsControllers',
                'homeControllers',
                'financeControllers',
                'financeServices'
                'syncServices',
                'ticketServices',
                'ticketTagServices',
                'tagServices',
                'ngResource',
                'ngRoute']

app.config ['$routeProvider', ($routeProvider) ->
  $routeProvider.
    when('/', {
      templateUrl: 'public/templates/finances.html',
      controller: 'FinanceController'
    }).
    when('/tickets', {
      templateUrl: 'public/templates/tickets.html',
      controller: 'HomeController'
    }).
    when('/sync', {
      templateUrl: 'public/templates/sync.html',
      controller: 'TicketsController'
    }).
    when('/finances', {
    }).
    otherwise({
      redirectTo: '/'
    })
]

app.config ($httpProvider) ->
  $httpProvider.defaults.headers.common['Authorization'] = 'Token token="8433f4313d49d1a89821e115579eed18"'
  $httpProvider.defaults.headers.post['Authorization'] = 'Token token="8433f4313d49d1a89821e115579eed18"'

