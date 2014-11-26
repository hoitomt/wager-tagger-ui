financeControllers = angular.module('financeControllers', [])

financeControllers.controller "FinanceController", ($scope) ->
  $scope.isCollapsed = true

  $scope.toggleNavigation = ->
    console.log "Toggle Nav"
    this.isCollapsed = !this.isCollapsed