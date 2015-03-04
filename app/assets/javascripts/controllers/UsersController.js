app.controller("UsersController", function($scope, $http, usersFactory){	
	$scope.users = usersFactory.get();
	console.log($scope.users);
});
