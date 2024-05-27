require "application_system_test_case"

class HellosTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  setup do
  @user = users(:one)
end

test "user not succ log in" do 
 visit new_user_session_path
 fill_in "Email", with: @user.email
fill_in "user_password", with: '123456'
all(:button, "Belépés")[1].click

assert_text "Bejelentkezés"
end

test "user succ log in" do 
visit new_user_session_path
 fill_in "Email", with: @user.email
fill_in "user_password", with: 'password'
all(:button, "Belépés")[1].click
assert_text "Kosaram"
end

test "add product to cart" do
visit new_user_session_path
fill_in "Email", with: @user.email
fill_in "user_password", with: 'password'
all(:button, "Belépés")[1].click
all('a.nav-link', text: 'Előétel').first.click
click_button "Kosárba"
click_on "Kosaram"
assert_text "Mennyiség: 1"
end

test "admin login" do 
admin = users(:two)
visit new_user_session_path
fill_in "Email", with: admin.email
fill_in "user_password", with: 'password'
all(:button, "Belépés")[1].click
assert_text "Étel szerkeztése"


end

end
