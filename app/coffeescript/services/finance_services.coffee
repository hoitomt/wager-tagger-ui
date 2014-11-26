financeServices = angular.module('financeServices', ['ngResource'])

financeServices.factory 'Finances', ['$resource', ($resource) ->
  $resource("#{API_SERVER}/finances", {}, {
    all: {
      method: 'GET',
      params:{start_date: '@start_date', stop_date: '@stop_date'},
      isArray: true
    }
  })
]
