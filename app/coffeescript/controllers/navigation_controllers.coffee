navigationControllers = angular.module('navigationControllers', [])

navigationControllers.controller "NavigationController", ($scope) ->
  $scope.isCollapsed = true

  $scope.toggleNavigation = ->
    console.log "Toggle Nav"
    this.isCollapsed = !this.isCollapsed