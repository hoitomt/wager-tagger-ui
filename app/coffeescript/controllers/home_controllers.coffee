homeControllers = angular.module('homeControllers', [])

homeControllers.controller("HomeController", ['$scope', '$http', '$routeParams', 'Ticket', 'TicketTag', 'Tag', ($scope, $http, $routeParams, Ticket, TicketTag, Tag) ->
  $scope.tickets = Ticket.range({start_date: '2015-06-01', stop_date: '2016-05-31'})
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
      ticketTag.amount = parseFloat(amount)
      ticketTag.name = getTagName($scope.selectedTicketTag.tag_id)

      ticket.ticket_tags.push(ticketTag)
      ticketTag.$save( (savedTicketTag) ->
        console.log "Saved", savedTicketTag
        ticketTag.id = savedTicketTag.id
      )
      $scope.resetUi()

  $scope.deleteTag = (ticketTag, ticket) ->
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
    $scope.selectedCustomTagAmount = {ticket_id: ticket.id}

  $scope.submitCustomTag = (ticket, ev) ->
    amount = $(ev.target).closest('form').find('#tag-amount').val()
    $scope.createTicketTag(ticket, amount)

    # Reset UI
    $(ev.target).closest('form').find('#tag-amount').val('')
    return

  $scope.customAmountSelected = (ticket) ->
    return $scope.selectedCustomTagAmount? && $scope.selectedCustomTagAmount.ticket_id == ticket.id

  $scope.toggleShowEditPanel = () ->
    $scope.showEditPanel = !$scope.showEditPanel

  $scope.ticketResultClass = (ticket) ->
    switch ticket.outcome
      when "Pending" then return "panel-warning"
      when "Lost" then return "panel-danger"
      when "Won" then return "panel-success"

  $scope.resetUi = () ->
    $scope.selectedTicketTag = null
    if $scope.selectedCustomTagAmount?
      $scope.selectedCustomTagAmount.ticket_id = null
    return

  $scope.ticketIsTagged = (ticket) ->
    if ticket.ticket_tags.length <= 0
      return "(Not Tagged)"

  $scope.amountTagged = calculateAmountTagged()
])
