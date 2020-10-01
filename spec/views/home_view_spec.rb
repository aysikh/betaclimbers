require 'rails_helper'


RSpec.describe 'Home Page View', type: :system do

  describe 'pages have correct content' do

    it "home page says 'LOGIN'" do
      visit "/"
      expect(page).to have_content("LOG IN")
    end

    it "home page says 'Sign Up'" do
      visit "/"
      expect(page).to have_content("Sign Up")
    end

    it "home page says 'username'" do 
      visit "/"
      expect(page).to have_content("Username")
    end

    it "home page says 'password" do
      visit "/"
      expect(page).to have_content("Password")
    end

  end
end
