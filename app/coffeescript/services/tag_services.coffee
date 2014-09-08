tagServices = angular.module('tagServices', ['ngResource'])

tagServices.factory 'Tag', ['$resource', ($resource) ->
  $resource('http://localhost:4001/tags/:id', {tagId:'@id'}, {
    all: {
      method: 'GET',
      isArray: true
    }
  })
]