var api_tags, api_tickets, app;

app = angular.module("wagerTagger", []);

app.controller("NavigationController", function($scope) {
  $scope.isCollapsed = true;
  return $scope.toggleNavigation = function() {
    console.log("Toggle Nav");
    return this.isCollapsed = !this.isCollapsed;
  };
});

app.controller("TicketController", function($scope) {
  var addTag, calculateAmountTagged, isSelectedTag, selectTag;
  $scope.tickets = api_tickets;
  $scope.tags = api_tags;
  $scope.selectedTag = null;
  calculateAmountTagged = function() {
    return 0.0;
  };
  selectTag = function(ticket, tag) {
    console.log("Select Tag: Tag Id: " + tag.id);
    $scope.selectedTag = {
      ticket_id: ticket.id,
      tag_id: tag.id
    };
  };
  addTag = function(ticketId, tagId) {
    return console.log("Add Tag - Ticket ID: " + ticketId + ", Tag Id: " + tagId);
  };
  isSelectedTag = function(ticket, tag) {
    var matches;
    console.log("" + tag.id + " == " + ($scope.selectedTag ? $scope.selectedTag.id : void 0));
    matches = ($scope.selectedTag != null) && $scope.selectedTag.ticket_id === ticket.id && $scope.selectedTag.tag_id === tag.id;
    if (matches) {
      console.log("Matches");
      return "btn-warning";
    } else {
      return "";
    }
  };
  $scope.selectTag = selectTag;
  $scope.isSelectedTag = isSelectedTag;
  $scope.amountTagged = calculateAmountTagged();
  return $scope.addTag = addTag;
});

api_tags = [
  {
    "id": 1,
    "name": "Mike"
  }, {
    "id": 2,
    "name": "Dad"
  }, {
    "id": 3,
    "name": "Steve"
  }, {
    "id": 4,
    "name": "NFL"
  }
];

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
    "tags": [
      {
        "ticket_id": 1,
        "tag_id": 1,
        "tag_name": 1,
        "amount": 10.0
      }
    ]
  }, {
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
  }, {
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
      }, {
        "id": 5,
        "ticket_id": 4,
        "away_team": "Kentucky",
        "away_score": 6,
        "home_team": "Vanderbilt",
        "home_score": 22,
        "line_item_date": "2013-11-16T12:20:00Z",
        "line_item_spread": "Vanderbilt -450"
      }, {
        "id": 6,
        "ticket_id": 4,
        "away_team": "Maryland",
        "away_score": 27,
        "home_team": "VirginiaTech",
        "home_score": 24,
        "line_item_date": "2013-11-16T12:30:00Z",
        "line_item_spread": "VirginiaTech -850"
      }, {
        "id": 7,
        "ticket_id": 4,
        "away_team": "OregonSt",
        "away_score": 17,
        "home_team": "ArizonaSt",
        "home_score": 30,
        "line_item_date": "2013-11-16T21:30:00Z",
        "line_item_spread": "ArizonaSt -600"
      }, {
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
  }
];
