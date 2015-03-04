app.factory('catalogsFactory', function($http){
	var catalogs = [];
	return {
		get: function(){
			if(catalogs.length == 0){
				$http.get('/catalogs')
					.success(function(response){
						for(var i=0; ii=response.length, i<ii; i++){
							catalogs.push(response[i]);
						}
					});
			}
			return catalogs;
		},
		add: function(){
		},
		remove: function(){
		},
		save: function(){
		}
	}
});
