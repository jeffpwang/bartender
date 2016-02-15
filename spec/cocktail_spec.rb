require 'spec_helper'
require 'pry'

describe Cocktail do 
    describe '#initialize' do 
        let(:cocktail){Cocktail.new("manhattan", 'www.google.com')}
        
    it 'creates a new instance of a cocktail' do 
        expect(cocktail).to be_an_instance_of(Cocktail)
    end 
    
    it 'accepts an argument of cocktail name' do 
        name = "manhattan"
        expect(cocktail.name).to eq(name)
    end 
    
    it 'accepts a link as an argument upon initialization' do 
        link = "http://www.bonappetit.com/recipe/manhattan"
        expect(cocktail.link).to eq(link)
    end 
    
    it 'accepts an empty array for @spirits upon initialization' do 
        expect(cocktail.spirits).to eq([])
    end 
    
    it 'accepts an empty array for @mixers upon initialization' do 
        expect(cocktail.mixers).to eq([])
    end 
    
    it 'accepts an empty array for @ingredients upon initialization' do 
        expect(cocktail.all_ingredients).to eq([])
    end 
    
    end 
    
    describe '#add_spirit' do
        let(:cocktail){Cocktail.new("manhattan", 'www.google.com')}
        let(:spirit){Spirit.new("whiskey")}
        
    it 'creates a new instance of spirit' do 
        new_spirit = cocktail.add_spirit("whiskey")
        expect(new_spirit).to be_an_instance_of(Spirit)
    end 
    
    it 'adds new instance of spirit to cocktail @spirits' do 
        new_spirit = cocktail.add_spirit("whiskey")
        expect(cocktail.spirits).to include(new_spirit)
    end 
    
    it 'adds new instance of spirit to cocktail @ingredients' do 
        new_spirit = cocktail.add_spirit("whiskey")
        expect(cocktail.all_ingredients).to include(new_spirit)
    end 
    end 
    
    describe '#add_mixer' do 
        let(:cocktail){Cocktail.new("manhattan", 'www.google.com')}
        let(:mixer){Mixer.new("vermouth")}
        
    it 'creates a new instance of mixer' do 
        new_mixer = cocktail.add_mixer("vermouth")
        expect(new_mixer).to be_an_instance_of(Mixer)
    end 
    
    it 'adds new instance of mixer to cocktail @mixers' do 
        new_mixer = cocktail.add_mixer("vermouth")
        expect(cocktail.mixers).to include(new_mixer)
    end 
    
    it 'adds new instance of mixer to cocktail @ingredients' do 
        new_mixer = cocktail.add_mixer("vermouth")
        expect(cocktail.all_ingredients).to include(new_mixer)
    end 
    end 
    
    describe 'Cocktail::clear' do 
        let(:cocktail){Cocktail.new("manhattan", 'www.google.com')}
        let(:cocktail1){Cocktail.new("gin and tonic", 'http://www.inspiredtaste.net/19488/gin-and-tonic-recipe/')}
        let(:cocktail2){Cocktail.new("rum coke", 'http://www.esquire.com/food-drink/drinks/recipes/a3769/cuba-libre-drink-recipe/')}
        
    it 'empties the array' do
        Cocktail.clear
        expect(Cocktail.all.count).to eq(0)
        expect(Cocktail.all).to eq([])
    end
    end 
    
    # describe 'Cocktail::all' do
    #     Cocktail.clear
    #     let(:cocktail){Cocktail.new("manhattan", 'www.google.com')}
    #     let(:cocktail1){Cocktail.new("gin and tonic", 'http://www.inspiredtaste.net/19488/gin-and-tonic-recipe/')}
    #     let(:cocktail2){Cocktail.new("rum coke", 'http://www.esquire.com/food-drink/drinks/recipes/a3769/cuba-libre-drink-recipe/')}
        
        
    # it "includes all cocktails in self" do
    #     cocktail = Cocktail.new("manhattan", 'www.google.com')
    #     cocktails = Cocktail.all
    #     expect (cocktails).to include(cocktail)
    #     expect (cocktails).to include(cocktail1)
    #     expect (cocktails).to include(cocktail2)
    #     expect (cocktail.all.count).to eq(3)
    # end
    # end
        
    
    
    describe 'Cocktail::find_associated_mixers' do
        
    end 
    
end 