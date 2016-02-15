require_relative '../config/environment.rb'
require_relative 'seed.rb'


def reload!
    load('../config/environment.rb')
end 

action = ''

while action != 'exit' || action != '3'

puts "Select an action: 
        1 - List All Cocktails
        2 - Choose from Ingredients
        3 - Exit"
        
action = gets.chomp

case action 
when '1'
    all_cocktails = Cocktail.return_name_of_cocktails
    all_cocktails.each_with_index do |
    end 
    
when '2'
    puts "Please choose a liquor preference? We have whiskey, gin, curacao, tequilla, and rum"
   # when action == 'list' #need to be able to select specific cocktail cocktail.name
    
    user_spirit_choice = gets.chomp
    associated_mixers = Cocktail.find_associated_mixers(user_spirit_choice)
    
    
    puts "Please choose a mixer:"
   
    ## update with each_with_index
  
    associated_mixers.each do |item|
       puts "#{item}" 
    end
    
    user_mixer_choice = gets.chomp
    
    cocktail_selection = Cocktail.find_cocktail(user_mixer_choice, user_spirit_choice)
    
    cocktail_selection.name
    
end
end 
 