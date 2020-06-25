class HomePage < SitePrism::Page

    element :logo, 'a[title="My Store"]'
    element :popular_link, 'a[class="homefeatured"]'
    element :size_select, '#uniform-group_1'
    element :btn_add_to_cart, 'button[class="exclusive"]'
    element :btn_checkout, 'a[title="Proceed to checkout"]'
    element :btn_confirm_address, 'button[name="processAddress"]'
    element :radio_terms, '#uniform-cgv'
    element :btn_process_ship, 'button[name="processCarrier"]'    
    element :pay_by_bank, '.bankwire'
    element :pay_by_check, '.cheque'
    element :btn_confirm_order, 'button[class="button btn btn-default button-medium"]'

    def addToCart(product, quantity, color, size)
        logo.click
        product_xpath = find(:xpath,"(//a[contains(text(), '#{product}')])[1]")
        scroll_to(popular_link, :top)
        sleep(3)
        product_xpath.click
        find('#quantity_wanted').set quantity
        size_select.double_click
        find(:xpath, "//select[@id='group_1']/option[@title='#{size}']").click

        begin
            find(:css, "a[name='#{color}']").click
        rescue Capybara::ElementNotFound => e
            puts "ELEMENT NOT FOUND: #{e}"
            fail
        end        
        btn_add_to_cart.click
    end

    def checkout
        btn_checkout.click
        sleep(3)
        btn_checkout.click
    end

    def confirm_adress
        btn_confirm_address.click
    end

    def confirm_shipping
        radio_terms.click
        btn_process_ship.click
    end

    def payment_method(payment)
        if payment == 'Bank Transfer'
            pay_by_bank.click
        elsif payment =='Check'
            pay_by_check.click
        else
            puts 'Payment method not found!'
        end

        btn_confirm_order.click
    end

end