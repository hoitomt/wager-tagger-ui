var tagServices;

tagServices = angular.module('tagServices', ['ngResource']);

tagServices.factory('Tag', [
  '$resource', function($resource) {
    return $resource('http://localhost:4001/tags/:id', {
      tagId: '@id'
    }, {
      all: {
        method: 'GET',
        isArray: true
      }
    });
  }
]);
