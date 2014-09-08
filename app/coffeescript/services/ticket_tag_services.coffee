ticketTagServices = angular.module('ticketTagServices', ['ngResource'])

ticketTagServices.factory 'TicketTag', ['$resource', ($resource) ->
  $resource('http://localhost:4001/tickets/:ticketId/ticket_tags/:id', {ticketId:'@ticket_id', ticketTagId:'@id'}, {
  })
]