app.controller("HomeController", function($scope, $http, catalogsFactory){	
	$scope.catalogs = catalogsFactory.get();
	console.log($scope.catalogs);
});
