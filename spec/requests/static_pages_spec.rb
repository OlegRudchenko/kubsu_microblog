require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Микроблог КубГУ'" do
      visit '/static_pages/home'
      expect(page).to have_content('Микроблог КубГУ')
    end

    it "should have the title 'Главная'" do
      visit '/static_pages/home'
      expect(page).to have_title("Микроблог КубГУ | Главная")
    end
  end

describe "Help page" do

    it "should have the content 'Помощь'" do
      visit '/static_pages/help'
      expect(page).to have_content('Помощь')
    end

    it "should have the title 'Помощь'" do
      visit '/static_pages/help'
      expect(page).to have_title("Микроблог КубГУ | Помощь")
    end
  end

  describe "About page" do

    it "should have the content 'О нас'" do
      visit '/static_pages/about'
      expect(page).to have_content('О нас')
    end

    it "should have the title 'О нас'" do
      visit '/static_pages/about'
      expect(page).to have_title("Микроблог КубГУ | О нас")
    end
  end

end