base_url = ENV["URL"]

# Visit the featured "Holy" sock from the front page
visit("http://#{base_url}/")
click_link "Holy"

# Assume that we don't have any socks yet
assert! page.has_content?("0 items in cart")

# Now add it to the cart
click_link "Add to cart"
assert! page.has_content?("1 item(s) in cart")

# Start checkout
click_on("1 item(s) in cart")

# Wait till all scripts pass
has_content?("1 item(s) in cart")

# Check for correct Subtotal value on order page
assert! page.find('th#orderSubtotal').text == '$99.99'

# TODO: to pass on final checkout page we need to add address/payment method or login
# Be aware - system not flushing cart on failed runs

# assert! page.has_content?("My orders")
# assert! page.has_content?("Your orders in one place.")
