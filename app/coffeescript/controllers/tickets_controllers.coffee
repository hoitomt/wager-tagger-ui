ticketsControllers = angular.module('ticketsControllers', [])

ticketsControllers.controller("TicketsController", ['$scope', 'SyncRecent', 'SyncAll', ($scope, SyncRecent, SyncAll) ->

  $scope.syncRecent = ->
    SyncRecent.get()

  $scope.syncAll = ->
    SyncAll.get()
])