ticketsControllers = angular.module('ticketsControllers', [])

ticketsControllers.controller("TicketController", ['$scope', '$http', 'Ticket', 'TicketTag', 'Tag', ($scope, $http, Ticket, TicketTag, Tag) ->
  $scope.tickets = Ticket.range({start_date: '2014-01-01', stop_date: '2014-05-31'})
  $scope.tags = Tag.all()
  $scope.selectedTicketTag = null
  $scope.selectedCustomTagAmount = null
  $scope.showEditPanel = false

  # This should live on a ticket model
  calculateAmountTagged = () ->
    0.0

  $scope.selectTag = (ticket, tag) ->
    if $scope.isSelectedTag(ticket, tag)
      $scope.selectedTicketTag = null
    else
      $scope.selectedTicketTag = {ticket_id: ticket.id, tag_id: tag.id}
    $scope.selectedCustomTagAmount = null

  getTagName = (tagId) ->
    for ticketTag in $scope.tags
      return ticketTag.name if ticketTag.id is tagId

  removeTicketTag = (ticket, deleteTicketTag) ->
    removeIndex = -1
    for ticketTag, i in ticket.ticket_tags
      removeIndex = i if ticketTag.id == deleteTicketTag.id
    console.log "Remove Index #{removeIndex}"
    ticket.ticket_tags.splice(removeIndex, 1)

  $scope.createTicketTag = (ticket, amount) ->
    if $scope.selectedTicketTag
      # Create Ticket
      ticketTag = new TicketTag
      ticketTag.ticket_id = ticket.id
      ticketTag.tag_id = $scope.selectedTicketTag.tag_id
      ticketTag.amount = amount
      ticketTag.name = getTagName($scope.selectedTicketTag.tag_id)

      ticket.ticket_tags.push(ticketTag)
      ticketTag.$save()

  $scope.addTag = (ticketId, tagId) ->
    console.log("Add Tag - Ticket ID: #{ticketId}, Tag Id: #{tagId}")

  $scope.deleteTag = (ticketTag, ticket) ->
    console.log "Delete Tag", ticketTag
    removeTicketTag(ticket, ticketTag)
    TicketTag.delete({ticketId: ticketTag.ticket_id, id: ticketTag.id})

  $scope.isSelectedTag = (ticket, tag) ->
    return $scope.selectedTicketTag? &&
           $scope.selectedTicketTag.ticket_id is ticket.id &&
           $scope.selectedTicketTag.tag_id is tag.id

  $scope.isSelectedTicket = (ticket) ->
    return $scope.selectedTicketTag? &&
           $scope.selectedTicketTag.ticket_id is ticket.id

  $scope.selectCustomTagAmount = (ticket) ->
    console.log "Select Custom Tag Amount"
    $scope.selectedCustomTagAmount = {ticket_id: ticket.id}

  $scope.customAmountSelected = (ticket) ->
    return $scope.selectedCustomTagAmount? && $scope.selectedCustomTagAmount.ticket_id == ticket.id

  $scope.toggleShowEditPanel = () ->
    $scope.showEditPanel = !$scope.showEditPanel

  $scope.amountTagged = calculateAmountTagged()
])