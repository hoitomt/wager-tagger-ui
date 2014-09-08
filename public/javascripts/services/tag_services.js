var tagServices;

tagServices = angular.module('tagServices', ['ngResource']);

tagServices.factory('Tag', [
  '$resource', function($resource) {
    return $resource("" + API_SERVER + "/tags/:id", {
      tagId: '@id'
    }, {
      all: {
        method: 'GET',
        isArray: true
      }
    });
  }
]);
