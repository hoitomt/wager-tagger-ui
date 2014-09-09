var ticketsControllers;

ticketsControllers = angular.module('ticketsControllers', []);

ticketsControllers.controller("TicketController", [
  '$scope', '$http', 'Ticket', 'TicketTag', 'Tag', function($scope, $http, Ticket, TicketTag, Tag) {
    var calculateAmountTagged, getTagName, removeTicketTag;
    $scope.tickets = Ticket.range({
      start_date: '2014-06-01',
      stop_date: '2015-05-31'
    });
    $scope.tags = Tag.all();
    $scope.selectedTicketTag = null;
    $scope.selectedCustomTagAmount = null;
    $scope.showEditPanel = false;
    calculateAmountTagged = function() {
      return 0.0;
    };
    $scope.selectTag = function(ticket, tag) {
      if ($scope.isSelectedTag(ticket, tag)) {
        $scope.selectedTicketTag = null;
      } else {
        $scope.selectedTicketTag = {
          ticket_id: ticket.id,
          tag_id: tag.id
        };
      }
      return $scope.selectedCustomTagAmount = null;
    };
    getTagName = function(tagId) {
      var ticketTag, _i, _len, _ref;
      _ref = $scope.tags;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        ticketTag = _ref[_i];
        if (ticketTag.id === tagId) {
          return ticketTag.name;
        }
      }
    };
    removeTicketTag = function(ticket, deleteTicketTag) {
      var i, removeIndex, ticketTag, _i, _len, _ref;
      removeIndex = -1;
      _ref = ticket.ticket_tags;
      for (i = _i = 0, _len = _ref.length; _i < _len; i = ++_i) {
        ticketTag = _ref[i];
        if (ticketTag.id === deleteTicketTag.id) {
          removeIndex = i;
        }
      }
      console.log("Remove Index " + removeIndex);
      return ticket.ticket_tags.splice(removeIndex, 1);
    };
    $scope.createTicketTag = function(ticket, amount) {
      var ticketTag;
      if ($scope.selectedTicketTag) {
        ticketTag = new TicketTag;
        ticketTag.ticket_id = ticket.id;
        ticketTag.tag_id = $scope.selectedTicketTag.tag_id;
        ticketTag.amount = parseFloat(amount);
        ticketTag.name = getTagName($scope.selectedTicketTag.tag_id);
        ticket.ticket_tags.push(ticketTag);
        return ticketTag.$save();
      }
    };
    $scope.deleteTag = function(ticketTag, ticket) {
      removeTicketTag(ticket, ticketTag);
      return TicketTag["delete"]({
        ticketId: ticketTag.ticket_id,
        id: ticketTag.id
      });
    };
    $scope.isSelectedTag = function(ticket, tag) {
      return ($scope.selectedTicketTag != null) && $scope.selectedTicketTag.ticket_id === ticket.id && $scope.selectedTicketTag.tag_id === tag.id;
    };
    $scope.isSelectedTicket = function(ticket) {
      return ($scope.selectedTicketTag != null) && $scope.selectedTicketTag.ticket_id === ticket.id;
    };
    $scope.selectCustomTagAmount = function(ticket) {
      return $scope.selectedCustomTagAmount = {
        ticket_id: ticket.id
      };
    };
    $scope.submitCustomTag = function(ticket, ev) {
      var amount;
      amount = $(ev.target).closest('form').find('#tag-amount').val();
      return $scope.createTicketTag(ticket, amount);
    };
    $scope.customAmountSelected = function(ticket) {
      return ($scope.selectedCustomTagAmount != null) && $scope.selectedCustomTagAmount.ticket_id === ticket.id;
    };
    $scope.toggleShowEditPanel = function() {
      return $scope.showEditPanel = !$scope.showEditPanel;
    };
    return $scope.amountTagged = calculateAmountTagged();
  }
]);
