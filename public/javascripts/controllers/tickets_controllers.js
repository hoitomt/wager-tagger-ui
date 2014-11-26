var ticketsControllers;

ticketsControllers = angular.module('ticketsControllers', []);

ticketsControllers.controller("TicketsController", [
  '$scope', 'SyncRecent', function($scope, SyncRecent) {
    $scope.isCollapsed = true;
    $scope.syncRecent = function() {
      return SyncRecent.get();
    };
    return $scope.syncAll = function() {
      return SyncAll.get();
    };
  }
]);
