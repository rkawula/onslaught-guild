d3.json("https://us.api.battle.net/wow/realm/status?locale=en_US&apikey=g4z3ngfmwsndpwtzr43e6tbps3crsqb7",
	function(error, root) {
  if (error) throw error;
  battleGroup(root);
  document.getElementById('test').innerHTML = "hoi"
});


function battleGroup(battleGroupName) {
	console.log(battleGroupName);
}