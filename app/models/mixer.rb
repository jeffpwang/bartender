class Mixer
    attr_accessor :name, :cocktails
    
    @@all = []
    
    def initialize(name)
        @cocktails = []
        @@all << self
        @name = name
    end
    
    def self.all
        @@all
    end
    
    def self.find_by_name(name)
        
        self.all.find do |mixer|
            mixer.name == name
        end
    end
    
    def self.return_name_of_mixers
        
        name_array = self.all.map do |mixer|
             mixer.name
        end
        name_array
    end
    
    
end 