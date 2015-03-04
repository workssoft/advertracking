var	app = angular.module("Advertisement", ['ngRoute']);

app.config(function($routeProvider){
	$routeProvider
	.when("/", {
		templateUrl: "home.html",
		controller: "HomeController"
	})
	.when("/users/:user_id",{
		templateUrl: "main.html",
		controller: "UsersController"
	})
});
  

