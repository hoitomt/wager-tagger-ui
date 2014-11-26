ticketsControllers = angular.module('ticketsControllers', [])

ticketsControllers.controller("TicketsController", ['$scope', 'SyncRecent', ($scope, SyncRecent) ->
  $scope.isCollapsed = true

  $scope.syncRecent = ->
    SyncRecent.get()

  $scope.syncAll = ->
    SyncAll.get()
])