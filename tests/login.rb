# Test if the user can log into the shop
base_url = ENV["URL"]

visit("http://#{base_url}/")
first(:link, "Login").click
fill_in "username", with: "user"
fill_in "password", with: "password"
click_button("Log in")

assert! evaluate_script('$.cookie("logged_in") != null && $.cookie("logged_in") != ""')
