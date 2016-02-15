require 'csv'
require 'pry'


    # CSV.foreach('./tools/cocktails_ingredients.csv') do |row| #[ingredient, cocktail_name, link]
    # #     binding.pry
    # end
    

# { cocktail = {:spirit => [], :mixers=> []} }

cocktail_hash = 
    { "manhattan" => {:spirits => ["whiskey"], :mixers => ["vermouth"], :link => 'http://www.bonappetit.com/recipe/manhattan' },
     "gin and tonic" => {:spirits =>["gin"], :mixers => ["tonic", "lime juice"], :link => 'http://www.inspiredtaste.net/19488/gin-and-tonic-recipe/' }, 
     "negroni" => {:spirits => ["gin"], :mixers => ["vermouth", "campari"], :link => 'http://www.bonappetit.com/recipe/negroni' },
     "mai tai" => {:spirits => ["curacao"], :mixers => ["lime juice"], :link => 'http://www.epicurious.com/recipes/food/views/mai-tai-230577' },
     "juan collins" => {:spirits => ["tequilla"], :mixers => ["lemon juice", "club soda", 'sugar'], :link => 'http://www.cocktailbuilder.com/recipe/juan-collins##searchResultsHeader'},
     "rum coke" => {:spirits => ["rum"], :mixers => ["coke"], :link => 'http://www.esquire.com/food-drink/drinks/recipes/a3769/cuba-libre-drink-recipe/' }
    }
# we're only grabbing one spirit, so may run into issue if there are two spirits in one cocktail

cocktail_hash.each do |cocktail_name, cocktail_hash_data|
  new_cocktail = Cocktail.new(cocktail_name, cocktail_hash_data[:link])
  new_cocktail.add_spirit(cocktail_hash_data[:spirits].first)
  cocktail_hash_data[:mixers].each do |mixer| 
      new_cocktail.add_mixer(mixer)
  end 
end 