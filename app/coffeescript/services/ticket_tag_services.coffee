ticketTagServices = angular.module('ticketTagServices', ['ngResource'])

ticketTagServices.factory 'TicketTag', ['$resource', ($resource) ->
  $resource("#{API_SERVER}/tickets/:ticketId/ticket_tags/:id", {ticketId:'@ticket_id', ticketTagId:'@id'}, {
  })
]