ticketServices = angular.module('ticketServices', ['ngResource'])

ticketServices.factory 'Ticket', ['$resource', ($resource) ->
  $resource('http://localhost:4001/tickets/:ticketId', {ticketId:'@id'}, {
    query: {
      method: 'GET',
      isArray: true
    }
    range: {
      method: 'GET',
      params:{start_date: '@start_date', stop_date: '@stop_date'},
      isArray: true
    },
    page: {
      method: 'GET',
      params:{limit: '10', page: '1'},
      isArray: true
    }
  })
]
