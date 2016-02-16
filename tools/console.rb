require_relative '../config/environment.rb'
require_relative 'seed.rb'


def reload!
    load('../config/environment.rb')
end 

action = ''

menu = "Select an action: 
        1 - List All Cocktails
        2 - Choose from Ingredients
        3 - Add a Cocktail
        4 - Exit"

while action != 'exit' || action != '3' do

puts menu

action = gets.chomp

    case action 

    when '1' #List All Cocktails

        new_controller = CocktailController.new
        new_controller.list_all_cocktails
        
    when '2' #Choose from ingredients
        puts "Please choose a liquor preference?"
        
        spirit_array = Spirit.return_name_of_spirits
        spirit_array.uniq.each do |spirit_line_item|
            puts "> #{spirit_line_item.split.map(&:capitalize).join(' ')}"
        end
        
        user_spirit_choice = gets.chomp
        
        associated_mixers = Cocktail.find_associated_mixers(user_spirit_choice.downcase)
        
        puts "Please choose a mixer that works well with your liquor choice:"
      
        associated_mixers.uniq.each do |item|
                    puts "> #{item.name.split.map(&:capitalize).join(' ')}"
        end
        user_mixer_choice = gets.chomp
        
        
        cocktail_selection = Cocktail.find_cocktail(user_mixer_choice.downcase, user_spirit_choice.downcase)
        user_cocktail = cocktail_selection.first.name 
        puts "The drink for you is a #{user_cocktail.split.map(&:capitalize).join(' ')}."
        
    when '3' 
        puts "What is the name of the cocktail you would like to add?"
        user_cocktail_name = gets.chomp 
        new_cocktail = Cocktail.new(user_cocktail_name.downcase)
        puts "What type of spirit is in this cocktail?"
        user_spirit = gets.chomp 
        
        new_cocktail.add_spirit(user_spirit.downcase)
        
        user_mixer = ''

        until user_mixer == "done"
            puts "What mixers are in your cocktail? Add one mixer at a time. Type 'done' when you are done adding mixers."
            user_mixer = gets.chomp 
            if user_mixer != 'done'
                new_cocktail.add_mixer(user_mixer.downcase)
            end 
        end 
        
        my_ingredients = []
        new_cocktail.all_ingredients.each do |ingredient| 
                my_ingredients << ingredient.name
        end 
        readable_my_ingredients = my_ingredients[0..-2].join(', ') + ' and ' + my_ingredients.last.to_s
        puts "You have created the #{new_cocktail.name.split.map(&:capitalize).join(' ')}! It contains #{readable_my_ingredients}." 
    
    when '4' #exit
        break
    end
end 
 