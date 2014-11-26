var financeControllers;

financeControllers = angular.module('financeControllers', []);

financeControllers.controller("FinanceController", function($scope) {
  $scope.isCollapsed = true;
  return $scope.toggleNavigation = function() {
    console.log("Toggle Nav");
    return this.isCollapsed = !this.isCollapsed;
  };
});
