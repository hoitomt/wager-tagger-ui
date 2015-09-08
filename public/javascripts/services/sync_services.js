var syncServices;

syncServices = angular.module('syncServices', ['ngResource']);

syncServices.factory('SyncAll', [
  '$resource', function($resource) {
    return $resource("" + API_SERVER + "/tickets/all", {});
  }
]);

syncServices.factory('SyncRecent', [
  '$resource', function($resource) {
    return $resource("" + API_SERVER + "/tickets/recent", {});
  }
]);
