d3.json("https://us.api.battle.net/wow/realm/status?locale=en_US&apikey=g4z3ngfmwsndpwtzr43e6tbps3crsqb7", function(error, root) {
  if (error) throw error;

  root['realms'].forEach(function(realm) {
  	console.log(realm.name);
  })
  

});