var financeServices;

financeServices = angular.module('financeServices', ['ngResource']);

financeServices.factory('Finances', [
  '$resource', function($resource) {
    return $resource("" + API_SERVER + "/finances", {}, {
      all: {
        method: 'GET',
        params: {
          start_date: '@start_date',
          stop_date: '@stop_date'
        },
        isArray: true
      }
    });
  }
]);
