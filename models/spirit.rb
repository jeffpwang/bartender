class Spirit
    attr_accessor :name, :cocktails
    
    @@all = []
    
    def initialize(name)
        @cocktails = []
        @@all << self
    end 
    
    def self.all
        @@all
    end 
    
    def self.find_by_name(name)
        self.all.find do |spirit|
            spirit.name == name
        end 
    end 
    
    
end 