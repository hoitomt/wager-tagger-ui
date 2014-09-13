# FastClick.attach(document.body)

window.addEventListener 'load', ->
    FastClick.attach(document.body);
, false

if window.location.hostname is "localhost"
  API_SERVER = "http://localhost:4001"
else
  API_SERVER = "http://wager-tagger-go-api.herokuapp.com"

app = angular.module "wagerTagger",
               ['navigationControllers',
                'ticketsControllers',
                'ticketServices',
                'ticketTagServices',
                'tagServices',
                'ngResource']

app.config ($httpProvider) ->
  $httpProvider.defaults.headers.common['Authorization'] = 'Token token="8433f4313d49d1a89821e115579eed18"'
  $httpProvider.defaults.headers.post['Authorization'] = 'Token token="8433f4313d49d1a89821e115579eed18"'

