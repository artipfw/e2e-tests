base_url = ENV["URL"]

# By Default Capybara doesn't clean cookies between tests
Capybara.current_session.driver.browser.clear_cookies

# Visit the featured "Holy" sock from the front page
visit("http://#{base_url}/")
click_link "Colourful"

# Assume that we don't have any socks yet
assert! page.has_content?("0 items in cart")

# Now add it to the cart
page.find('#buttonCart').click

assert! page.has_content?("1 item(s) in cart")

# Start checkout
click_on("1 item(s) in cart")

# Wait till all scripts pass
has_content?("1 item(s) in cart")

# Check for correct Subtotal value on order page
cartTotal = page.find('th#cartTotal').text
assert! page.find('th#orderSubtotal').text == cartTotal

# Address isn't works properly on the site, so using login
first(:link, "Login").click
fill_in "username", with: "Eve_Berger"
fill_in "password", with: "eve"
click_button("Log in")

click_on("Proceed to checkout")

assert! page.has_content?("My orders")
assert! page.has_content?("Your orders in one place.")
