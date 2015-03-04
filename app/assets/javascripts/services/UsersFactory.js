app.factory('usersFactory', function($http){
	var users = [];
	return {
		get: function(){
			if(users.length == 0){
				$http.get('/users')
					.success(function(response){
						for(var i=0; ii=response.length, i<ii; i++){
							users.push(response[i]);
						}
					});
			}
			return users;
		},
		add: function(){
		},
		remove: function(){
		},
		save: function(){
		}
	}
});



/*app.factory("usersFactory", function($http){
	var usersFactory = {}; 
	var userList = [];	

	/*usersFactory.initialize = function(){
		$http.get('/users').
		success(function(data, status, headers, config){
			userList.push(data);		
			//console.log("user list ilk");
			//console.log(userList[0]);
		}).	
		error(function(data, status, headers, config){	 			
		});	
	}*/

 	//this.initialize();

	/*usersFactory.getUsers = function(){
	 
		$http.get('/users').
		success(function(data, status, headers, config){
			userList.push(data);		
			//console.log("user list ilk");
			//console.log(userList[0]);
		}).	
		error(function(data, status, headers, config){	 			
		});
		//console.log("user list ikinci");
		//console.log(userList);
		return userList[0]; 
	}
 
	return usersFactory;

});*/
