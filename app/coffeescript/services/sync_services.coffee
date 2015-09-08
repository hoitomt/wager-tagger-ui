syncServices = angular.module('syncServices', ['ngResource'])

syncServices.factory 'SyncAll', ['$resource', ($resource) ->
  $resource("#{API_SERVER}/tickets/all", {  })
]

syncServices.factory 'SyncRecent', ['$resource', ($resource) ->
  $resource("#{API_SERVER}/tickets/recent", {  })
]
