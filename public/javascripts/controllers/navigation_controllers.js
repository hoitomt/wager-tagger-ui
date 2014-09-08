var navigationControllers;

navigationControllers = angular.module('navigationControllers', []);

navigationControllers.controller("NavigationController", function($scope) {
  $scope.isCollapsed = true;
  return $scope.toggleNavigation = function() {
    console.log("Toggle Nav");
    return this.isCollapsed = !this.isCollapsed;
  };
});
