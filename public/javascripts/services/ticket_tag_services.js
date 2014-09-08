var ticketTagServices;

ticketTagServices = angular.module('ticketTagServices', ['ngResource']);

ticketTagServices.factory('TicketTag', [
  '$resource', function($resource) {
    return $resource("" + API_SERVER + "/tickets/:ticketId/ticket_tags/:id", {
      ticketId: '@ticket_id',
      ticketTagId: '@id'
    }, {});
  }
]);
