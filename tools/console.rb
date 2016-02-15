require_relative '../config/environment.rb'
require_relative 'seed.rb'


def reload!
    load('../config/environment.rb')
end 

action = ''

menu = "Select an action: 
        1 - List All Cocktails
        2 - Choose from Ingredients
        3 - Exit"
        

while action != 'exit' || action != '3' do

puts menu

action = gets.chomp

case action 

when '1'

    all_cocktails = Cocktail.return_name_of_cocktails
    all_cocktails.each_with_index do |cocktail, index|
        puts "#{index + 1}. #{cocktail.capitalize}"
    end # lists all cocktails by number
    
    puts "Select the number corresponding to a cocktail to view its ingredients and recipe."
    
    cocktail_selection = gets.chomp 
    
    if cocktail_selection.to_i.class == Fixnum
        selected_cocktail = all_cocktails[cocktail_selection.to_i - 1]
        my_cocktail = Cocktail.find_by_name(selected_cocktail)
        my_ingredients = []
        my_cocktail.all_ingredients.each do |ingredient| 
            my_ingredients << ingredient.name
        end 
        new_my_ingredients = my_ingredients[0..-2].join(', ') + ' and ' + my_ingredients.last.to_s
        puts "The #{my_cocktail.name.capitalize} contains #{new_my_ingredients}. Click on the following link to see recipe: #{my_cocktail.link}"
    end 
        
    
when '2'
    puts "Please choose a liquor preference? We have whiskey, gin, curacao, tequilla, and rum"
    
    
    #spirit_array = Spirit.return_name_of_spirits
    
    #We have whiskey, gin, curacao, tequilla, and rum"
    # update the liquors shown initially so it hits an array.
   # when action == 'list' #need to be able to select specific cocktail cocktail.name
    
    user_spirit_choice = gets.chomp
    associated_mixers = Cocktail.find_associated_mixers(user_spirit_choice)
    
    puts "Please choose a mixer that works well with your liquor choice:"
  
    associated_mixers.each do |item|
                puts "> #{item.name}"
    end
    user_mixer_choice = gets.chomp
    
    cocktail_selection = Cocktail.find_cocktail(user_mixer_choice, user_spirit_choice)
    
    puts "The drink for you is a #{cocktail_selection.name}"
    
when '3' 
    break
end
end 
 