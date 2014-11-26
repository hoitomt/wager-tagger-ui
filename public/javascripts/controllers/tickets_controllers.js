var ticketsControllers;

ticketsControllers = angular.module('ticketsControllers', []);

ticketsControllers.controller("TicketsController", [
  '$scope', 'SyncRecent', 'SyncAll', function($scope, SyncRecent, SyncAll) {
    $scope.syncRecent = function() {
      return SyncRecent.get();
    };
    return $scope.syncAll = function() {
      return SyncAll.get();
    };
  }
]);
