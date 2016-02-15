#generally ignore this file because it is just me (jeff) trying to test how to extract the data in a usable format 

require 'csv'
require 'pry'
require 'json'



  def cocktail 

    all_names = []
    all_ingredients = []
    all_links = []
    cocktail_hash = {}

      CSV.foreach('./database/cocktails_ingredients.csv') do |row|
        all_names << row[1]
        all_ingredients << row[0]
        all_links << row[2]
        cocktail_names = all_names.uniq
        cocktail_names.each do |name| 
          cocktail_hash[name] = {:ingredients => [], :link => ''}
        end
      end


      CSV.foreach('./database/cocktails_ingredients.csv') do |row|
        cocktail_hash.each do |name, hash| 
          if name == row[1] 
            unless hash[:ingredients].include?(row[0])
              hash[:ingredients] << row[0]
            end 
            hash[:link] = row[2]
          end 
        end 
      end
      
      binding.pry
      
    end 
    
    cocktail 




