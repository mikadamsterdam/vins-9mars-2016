Review.create!([
  {expert_name: "Jean Dubois", review: "poor wine. you can used to cook", rating: 1, wine_id: 2},
  {expert_name: "John Smith", review: "This is a Haut-Medoc a very nice Bordeaux, that we would like to drink every day", rating: 3, wine_id: 4},
  {expert_name: "Roberto Rodriguez", review: "This Cotes-de-Blaye should be offered to your friends", rating: 5, wine_id: 4},
  {expert_name: "Claude Maratier", review: "This Cadillac is like the cars of the same name. Power full, old and you have a lot of pleasure to drink it.", rating: 5, wine_id: 4},
  {expert_name: "Mikael Le Bigot", review: "bad wine", rating: 0, wine_id: 2},
  {expert_name: "Edwuard Chelsea", review: "My hart is always open to test a \"Grand Crus\" and this Veuve Clicquot is wonderful in your mouth", rating: 5, wine_id: 3},
  {expert_name: "Cameroon Duck", review: "Taittinger is one of the best Chanpagne and they know to do it since 1734. Expensive but what a pleasure :-)", rating: 5, wine_id: 3},
  {expert_name: "David Schultz", review: "This Graves is not the best Bordeaux of the region but you can really enjoy it during a good meal", rating: 4, wine_id: 4}
])
Wine.create!([
  {name: "gros plant nantais", description: "dry white wine", origin: "nantaise"},
  {name: "corbiere", description: "wine for table", origin: "corbiere"},
  {name: "champagne", description: "wine for export and used for special occasion. Particularity: a sparkling wine", origin: "Champagne"},
  {name: "Bordeaux", description: "good wine and make for export", origin: "Bordeaux"}
])
