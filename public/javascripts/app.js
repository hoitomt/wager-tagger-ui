var API_SERVER, app;

window.addEventListener('load', function() {
  return FastClick.attach(document.body);
}, false);

if (window.location.hostname === "localhost") {
  API_SERVER = "http://localhost:4001";
} else {
  API_SERVER = "http://wager-tagger-go-api.herokuapp.com";
}

app = angular.module("wagerTagger", ['navigationControllers', 'ticketsControllers', 'ticketServices', 'ticketTagServices', 'tagServices', 'ngResource']);

app.config(function($httpProvider) {
  $httpProvider.defaults.headers.common['Authorization'] = 'Token token="8433f4313d49d1a89821e115579eed18"';
  return $httpProvider.defaults.headers.post['Authorization'] = 'Token token="8433f4313d49d1a89821e115579eed18"';
});
