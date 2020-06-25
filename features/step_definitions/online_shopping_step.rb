@home = HomePage.new
@history = OrderHistoryPage.new

Given('I choose {string}, {string}, {string} and {string} of the product') do |product, quantity, color, size|
    @home.addToCart(product, quantity, color, size)
    cart_validation = find(:xpath,"//div[@class='layer_cart_product col-xs-12 col-md-6']//h2")
    expect(cart_validation.text).to eq 'Product successfully added to your shopping cart'
end

And('confirm  the adress and delivery options') do
    @home.checkout
    expect(page.has_text?('Automation')).to eq true
    expect(page.has_text?('Dallas, Texas 75201')). to eq true
    expect(page.has_text?('United States')).to eq true
    @home.confirm_adress
    @home.confirm_shipping
end

When('choose the {string} method and confirm') do |payment|
    @home.payment_method(payment)
end

Then('the purchase should be successfully realized') do
    expect(page.has_text?('Your order on My Store is complete.')).to eq true
    
end

# ORDER HISTORY

Given('I access the order history') do
    @history.access_order_history
end

Then('the order number {string} should be visible in the history') do |order|
    order_text = find(:xpath, "//*[normalize-space(text()) = '#{order}']")
    expect(order_text.text).to eq "#{order}"
    # expect(page.has_text?(order)).to eq true
    log("Order reference: #{order_text.text}")
end