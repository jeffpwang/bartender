require 'spec_helper'

describe Customer do 
    describe '#initialize' do 
        let(:user){Customer.new}
        
    it 'creates a new instance of a customer' do 
        expect(user).to be_an_instance_of Customer
    end 
    
end 
end 