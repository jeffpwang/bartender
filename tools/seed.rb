require 'csv'
require 'pry'

    all_names = []
    all_ingredients = []
    all_links = []
    cocktail_hash = {}


# CSV.foreach('./tools/cocktails_ingredients.csv') do |row| #[spirit/mixer, ingredient, cocktail_name, link]
#     all_names << row[2]
#     cocktail_names = all_names.uniq
#     cocktail_names.each do |name| 
#     cocktail_hash[name] = {:spirits => [], :mixers => [], :link => ''}
#     end
# end

# CSV.foreach('./tools/cocktails_ingredients.csv') do |row| #[spirit/mixer, ingredient, cocktail_name, link]
#         cocktail_hash.each do |name, hash| 
#           if name == row[2] && row[0] == "Spirit"
#             unless hash[:spirits].include?(row[1])
#               hash[:spirits] << row[1]
#             end 
#             hash[:link] = row[3]
#           elsif name == row[2] && row[0] == "Mixer"
#             unless hash[:mixers].include?(row[1])
#               hash[:mixers] << row[1]
#             end 
#             hash[:link] = row[3]
#           end 
#         end 
# end



# cocktail_hash.each do |cocktail_name, cocktail_hash_data|
#   new_cocktail = Cocktail.new(cocktail_name, cocktail_hash_data[:link])
#   cocktail_hash_data[:spirits].each do |spirit|
#       new_cocktail.add_spirit(spirit)
#   end
#   cocktail_hash_data[:mixers].each do |mixer| 
#       new_cocktail.add_mixer(mixer)
#   end 
# end 
    

cocktail_hash = 
    { "manhattan" => {:spirits => ["whiskey"], :mixers => ["vermouth"], :link => 'http://www.bonappetit.com/recipe/manhattan' },
     "gin & tonic" => {:spirits =>["gin"], :mixers => ["tonic", "lime juice"], :link => 'http://www.inspiredtaste.net/19488/gin-and-tonic-recipe/' }, 
     "negroni" => {:spirits => ["gin"], :mixers => ["vermouth", "campari"], :link => 'http://www.bonappetit.com/recipe/negroni' },
     "mai tai" => {:spirits => ["curacao"], :mixers => ["lime juice"], :link => 'http://www.epicurious.com/recipes/food/views/mai-tai-230577' },
     "juan collins" => {:spirits => ["tequila"], :mixers => ["lemon juice", "club soda", 'sugar'], :link => 'http://www.cocktailbuilder.com/recipe/juan-collins##searchResultsHeader'},
     "rum & coke" => {:spirits => ["rum"], :mixers => ["coke"], :link => 'http://www.esquire.com/food-drink/drinks/recipes/a3769/cuba-libre-drink-recipe/' }, 
     "old fashioned" =>{:spirits => ["whiskey"], :mixers => ["bitters", "sugar"], :link => 'http://www.seriouseats.com/recipes/2008/06/traditional-old-fashioned-recipe.html'}, 
      "margarita" =>{:spirits => ["tequila"], :mixers => ["triple sec", "lime juice"], :link => 'http://www.seriouseats.com/recipes/2015/04/classic-margarita-recipe-tequila-cocktail.html'}, 
      "mint julep" =>{:spirits => ["bourbon"], :mixers => ["mint", "sugar"], :link => 'http://www.seriouseats.com/recipes/2010/04/how-to-make-a-mint-julep-recipe-derby-day.html'}, 
      "tom collins" =>{:spirits => ["gin"], :mixers => ["club soda", "lemon juice", "sugar"], :link => 'http://allrecipes.com/recipe/222511/tom-collins-cocktail/'},
      "cosmopolitan" =>{:spirits => ["vodka"], :mixers => ["triple sec", "cranberry juice", "lime juice"], :link => 'http://www.seriouseats.com/recipes/2011/10/how-to-make-a-cosmopolitan-cocktail-best-recipe.html'},      "vieux carré" =>{:spirits => ["whiskey"], :mixers => ["bitters", "cognac", "vermouth"], :link => 'http://www.seriouseats.com/recipes/2008/07/vieux-carre-recipe.html'},

 }
# we're only grabbing one spirit, so may run into issue if there are two spirits in one cocktail

cocktail_hash.each do |cocktail_name, cocktail_hash_data|
  new_cocktail = Cocktail.new(cocktail_name, cocktail_hash_data[:link])
  new_cocktail.add_spirit(cocktail_hash_data[:spirits].first)
  cocktail_hash_data[:mixers].each do |mixer| 
      new_cocktail.add_mixer(mixer)
  end 
end 

