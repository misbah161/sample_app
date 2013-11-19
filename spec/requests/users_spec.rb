require 'spec_helper'

describe "Users" do
  
  describe "signup" do
    
    before { visit signup_path }
    
    let(:submit) { "Sign up" }
    
    describe "faliure" do
      it "should not make a new user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "success" do
      
      before do
        fill_in "Name",         :with => "Example User"
        fill_in "Email",        :with => "user@example.com"
        fill_in "Password",     :with => "welcome"
        fill_in "Confirmation", :with => "welcome"
      end
      
      it "should make a new user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end
