tagServices = angular.module('tagServices', ['ngResource'])

tagServices.factory 'Tag', ['$resource', ($resource) ->
  $resource("#{API_SERVER}/tags/:id", {tagId:'@id'}, {
    all: {
      method: 'GET',
      isArray: true
    }
  })
]