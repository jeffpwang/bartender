class Cocktail

    
    attr_accessor :name, :spirits, :mixers, :all_ingredients, :link
    @@all = []
    
    def initialize(name, link = "no link provided")
        @name = name 
        @spirits = []
        @mixers = []
        @all_ingredients = []
        @link = link
        @@all << self
    end 
    
    def add_spirit(spirit) 
        new_spirit = Spirit.new(spirit)
        new_spirit.cocktails << self
        self.spirits << new_spirit
        self.all_ingredients << new_spirit
        new_spirit
    end 
    
    def self.all
        @@all
    end 
    
    def self.clear
        self.all.clear
    end
    
    def add_mixer(mixer)
        new_mixer = Mixer.new(mixer)
        new_mixer.cocktails << self 
        self.mixers << new_mixer
        self.all_ingredients << new_mixer
        new_mixer
    end 
    
    def add_ingredient(ingredient)
        self.all_ingredients << ingredient
    end 
    
    ##Find by spirit and return mixer. Provide spirit and return array of associated mixers.
    def self.find_associated_mixers(spirit_name)
        
        #binding.pry
        spirit_id = Spirit.find_by_name(spirit_name)
        
        list_of_cocktails = self.all.select do |cocktail_instance|
            cocktail_instance.spirits.include?(spirit_id)
        end
        
        list_of_cocktails.each_with_object([]) do |cocktail, array_of_mixers|
            array_of_mixers << cocktail.mixers
        end.flatten.uniq
         
    end
    
    ## returns the names of cocktails into an array
    def self.return_name_of_cocktails
        name_array = self.all.map do |cocktail|
             cocktail.name
        end
        
        name_array
        
    end
    
    def self.find_cocktail(mixer_name, spirit_name)
        
        mixer_object = Mixer.find_by_name(mixer_name)
        spirit_object = Spirit.find_by_name(spirit_name)
        #binding.pry
         list_of_cocktails = self.all.select do |cocktail_instance|
            cocktail_instance.spirits.include?(spirit_object)
        end
        
        cocktail_selection = list_of_cocktails.find do |cocktail|
            cocktail.mixers.include?(mixer_object)
        end
        
        
        cocktail_selection
        
    end
    
    def self.find_by_name(name)
        self.all.find do |cocktail|
            cocktail.name == name
        end 
    end 
    
    
    
end