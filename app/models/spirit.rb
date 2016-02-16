class Spirit
    attr_accessor :name, :cocktails
    
    @@all = []
    
    def initialize(name)
        @cocktails = []
        @name = name
        @@all << self
    end 
    
    def self.all
        @@all
    end 
    
    def self.return_name_of_spirits
        
        name_array = self.all.map do |spirit|
             spirit.name
        end
        name_array
    end
    
    def self.find_by_name(name)
        self.all.find do |spirit|
            spirit.name == name
        end 
    end 
    
    
end 