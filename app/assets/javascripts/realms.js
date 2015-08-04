d3.json("https://us.api.battle.net/wow/realm/status?locale=en_US&apikey=g4z3ngfmwsndpwtzr43e6tbps3crsqb7", function(error, root) {
  if (error) throw error;
  list = []
  root['realms'].forEach(function(realm) {
  	list.push(realm.name)
  });
  window.alert(list);
  document.getElementById('test').innerHTML = list;

});