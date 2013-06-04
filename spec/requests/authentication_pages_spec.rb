require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Войти') }
    it { should have_title('Войти') }
  end

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Войти" }

      it { should have_title('Войти') }
      it { should have_selector('div.alert.alert-error', text: 'Ошибка') }

      describe "after visiting another page" do
        before { click_link "Главная" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Пароль", with: user.password
        click_button "Войти"
      end

      it { should have_title(user.name) }
      it { should have_link('Аккаунт',     href: user_path(user)) }
      it { should have_link('Выйти',    href: signout_path) }
      it { should_not have_link('Войти', href: signin_path) }

      describe "followed by signout" do
        before { click_link "Выйти" }
        it { should have_link('Войти') }
      end
    end
  end
end