class Show

  attr_reader :all_cocktails

  def initialize(all_cocktails) 
    @all_cocktails = all_cocktails
    all_cocktails.each_with_index do |cocktail, index|
          puts "#{index + 1}. #{cocktail.split.map(&:capitalize).join(' ')}"
    end 
  end 

  def render
    puts "Select the number corresponding to a cocktail to view its ingredients and recipe."
    cocktail_selection = gets.chomp 
        
    if cocktail_selection.to_i.class == Fixnum
      selected_cocktail = self.all_cocktails[cocktail_selection.to_i - 1]
      my_cocktail = Cocktail.find_by_name(selected_cocktail)
      my_ingredients = []
      my_cocktail.all_ingredients.each do |ingredient| 
           my_ingredients << ingredient.name
      end 
      # readable_my_ingredients = my_ingredients[0..-2].join(', ') + ' and ' + my_ingredients.last.to_s
          puts "Click on the following link to see recipe: #{my_cocktail.link}"
    end 
  end 

end 