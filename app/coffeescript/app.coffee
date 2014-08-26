
app = angular.module "wagerTagger", []

app.controller "NavigationController", ($scope) ->
  $scope.isCollapsed = true

  $scope.toggleNavigation = ->
    console.log "Toggle Nav"
    this.isCollapsed = !this.isCollapsed

app.controller "TicketController", ($scope) ->
  $scope.tickets = api_tickets
  $scope.tags = api_tags
  $scope.selectedTicketTag = null
  $scope.selectedCustomTagAmount = null

  # This should live on a ticket model
  calculateAmountTagged = () ->
    0.0

  $scope.selectTag = (ticket, tag) ->
    if $scope.isSelectedTag(ticket, tag)
      $scope.selectedTicketTag = null
    else
      $scope.selectedTicketTag = {ticket_id: ticket.id, tag_id: tag.id}
    $scope.selectedCustomTagAmount = null

  $scope.selectAmount = (ticket, amount) ->
    if $scope.selectedTicketTag
      console.log "Ticket #{ticket.id}, Amount #{amount} Tag #{$scope.selectedTicketTag.tag_id}"

  $scope.addTag = (ticketId, tagId) ->
    console.log("Add Tag - Ticket ID: #{ticketId}, Tag Id: #{tagId}")

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


  # showTagAmountDiv = (ticket) ->
  #   return unless ticket?
  #   $("#collapse-tag-amount-#{ticket.id}").collapse('show')

  # hideTagAmountDiv = (ticket) ->
  #   return unless ticket?
  #   $("#collapse-tag-amount-#{ticket.id}").collapse('hide')

  $scope.amountTagged = calculateAmountTagged()

api_tags = [
  {"id":1, "name": "Mike"},
  {"id":2, "name": "Dad"},
  {"id":3, "name": "Steve"}
  {"id":4, "name": "NFL"}
]

api_tickets = [
  {
    "id": 1,
    "sb_bet_id": 426557454,
    "wager_date": "2013-11-18T22:07:00Z",
    "wager_type": "Straight Wager",
    "amount_wagered": 10,
    "amount_to_win": 8.33,
    "outcome": "Won",
    "ticket_line_items": [
      {
        "id": 1,
        "ticket_id": 1,
        "away_team": "New England Patriots",
        "away_score": 17,
        "home_team": "Carolina Panthers",
        "home_score": 14,
        "line_item_date": "2013-11-18T23:10:00Z",
        "line_item_spread": "New England Patriots -0.5 (-120)"
      }
    ],
    "tags":[
      {
        "ticket_id": 1,
        "tag_id": 1,
        "tag_name": 1,
        "amount": 10.0
      }
    ]
  },
  {
    "id": 3,
    "sb_bet_id": 426020325,
    "wager_date": "2013-11-15T18:15:00Z",
    "wager_type": "Straight Wager",
    "amount_wagered": 25,
    "amount_to_win": 22.73,
    "outcome": "Lost",
    "ticket_line_items": [
      {
        "id": 3,
        "ticket_id": 3,
        "away_team": "Stanford",
        "away_score": 17,
        "home_team": "USC",
        "home_score": 20,
        "line_item_date": "2013-11-16T20:20:00Z",
        "line_item_spread": "Stanford -4 (-110)"
      }
    ]
  },
  {
    "id": 4,
    "sb_bet_id": 426020134,
    "wager_date": "2013-11-15T18:14:00Z",
    "wager_type": "Parlay (5 Teams)",
    "amount_wagered": 20,
    "amount_to_win": 24.52,
    "outcome": "Lost",
    "ticket_line_items": [
      {
        "id": 4,
        "ticket_id": 4,
        "away_team": "HoustonU",
        "away_score": 13,
        "home_team": "Louisville",
        "home_score": 20,
        "line_item_date": "2013-11-16T19:10:00Z",
        "line_item_spread": "Louisville -700"
      },
      {
        "id": 5,
        "ticket_id": 4,
        "away_team": "Kentucky",
        "away_score": 6,
        "home_team": "Vanderbilt",
        "home_score": 22,
        "line_item_date": "2013-11-16T12:20:00Z",
        "line_item_spread": "Vanderbilt -450"
      },
      {
        "id": 6,
        "ticket_id": 4,
        "away_team": "Maryland",
        "away_score": 27,
        "home_team": "VirginiaTech",
        "home_score": 24,
        "line_item_date": "2013-11-16T12:30:00Z",
        "line_item_spread": "VirginiaTech -850"
      },
      {
        "id": 7,
        "ticket_id": 4,
        "away_team": "OregonSt",
        "away_score": 17,
        "home_team": "ArizonaSt",
        "home_score": 30,
        "line_item_date": "2013-11-16T21:30:00Z",
        "line_item_spread": "ArizonaSt -600"
      },
      {
        "id": 8,
        "ticket_id": 4,
        "away_team": "WashingtonSt",
        "away_score": 24,
        "home_team": "ArizonaU",
        "home_score": 17,
        "line_item_date": "2013-11-16T14:00:00Z",
        "line_item_spread": "ArizonaU -450"
      }
    ]
  },
]