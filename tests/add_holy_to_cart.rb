# Add the Holy sock to the cart
base_url = ENV["URL"]

# By Default Capybara doesn't clean cookies between tests
Capybara.current_session.driver.browser.clear_cookies

visit("http://#{base_url}/")
click_link "Holy"

# Make sure that cart is empty
assert! page.has_content?("0 items in cart")

click_link "Add to cart"

# Intermediate check to let page get updates
page.has_content?("1 items in cart")
puts "Still have '0 items in cart'? #{page.has_content?("0 items in cart")}"

puts "Ok. Final check"
assert! page.has_content?("1 item(s) in cart")
