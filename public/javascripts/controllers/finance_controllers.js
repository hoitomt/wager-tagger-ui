var financeControllers;

financeControllers = angular.module('financeControllers', []);

financeControllers.controller("FinanceController", [
  '$scope', 'Finances', function($scope, Finances) {
    return $scope.finances = Finances.all({
      start_date: '2014-06-01',
      stop_date: '2015-05-31'
    });
  }
]);
