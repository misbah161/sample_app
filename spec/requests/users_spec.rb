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
  
  describe "signin" do
    
    before { visit signin_path }
    
    let(:submit) { "Sign in" }
    
    describe "faliure" do 
      
      it "should not sign a user in" do
        click_button submit
	page.should have_selector('div.flash.error', :content => "Invalid")
      end
    end
    
    describe "success" do 
      
      before do
        user = FactoryGirl.create(:user)
	fill_in "Email",    :with => user.email
        fill_in "Password", :with => user.password
      end
      
      it "should sign a user in" do
        click_button submit
	page.should have_selector("a", :href => signout_path,
                                     :content => "Sign out")
	click_link "Sign out"
	page.should have_selector("a", :href => signin_path,
                                     :content => "Sign in")
      end
    end
  end
end
