var financeControllers;

financeControllers = angular.module('financeControllers', []);

financeControllers.controller("FinanceController", [
  '$scope', 'Finances', function($scope, Finances) {
    return $scope.finances = Finances.all({
      start_date: SEASON_START_DATE,
      stop_date: SEASON_STOP_DATE
    });
  }
]);
