class UserRegisterPage < SitePrism::Page

    # --------- MAPPING ---------

    element :btn_sign_in, 'a[class="login"]'
    # Personal information
    element :email_input, '#email_create'
    element :btn_create_account, '#SubmitCreate'
    element :radio_mr, '#uniform-id_gender1'
    element :radio_mrs, '#uniform-id_gender2'
    element :username_input, '#customer_firstname'
    element :userLastName_input, '#customer_lastname'
    element :userEmail_input, '#email'
    element :password, '#passwd'
    element :combo_days, :xpath, "//div[@id='uniform-days']"
    element :combo_month, '#uniform-months'
    element :combo_year, '#uniform-years'
    element :checkNews,'#uniform-newsletter'
    element :checkOffers, '#uniform-optin'
    # Address
    element :address_username_input, '#firstname'
    element :address_lastName_input, '#lastname'
    element :address, '#address1'
    element :city, '#city'
    element :state, '#uniform-id_state'
    element :zipcode, '#postcode'
    element :country, '#uniform-id_country'
    element :mobilePhone, '#phone_mobile'
    element :addressAlias, '#alias'
    element :btnRegister, '#submitAccount'

    # --------- METHODS ---------

    def load_page
        visit '/index.php'
    end

    def userRegistration
        btn_sign_in.click
        email_input.send_keys('capy@test.com.br.qa')
        btn_create_account.click
    end

    def fillRegistrationForm(table)
        @data = table.rows_hash

        # checking radio button
        if @data['title'] == 'Mr'
            radio_mr.click
        elsif @data['title'] == 'Mrs'
            radio_mrs.click
        else
            puts 'Radio Button Not found!'
        end

        username_input.set @data['firstName']
        userLastName_input.set @data['lastName']
        userEmail_input.native.clear
        userEmail_input.set @data['email']
        password.set @data['password']
        combo_days.double_click
        find(:xpath,"//select[@id='days']/option[@value='#{@data['birthDay']}']").click
        combo_month.double_click
        find(:xpath,"//select[@id='months']/option[@value='#{@data['birthMonth']}']").click
        combo_year.double_click
        find(:xpath,"//select[@id='years']/option[@value='#{@data['birthYear']}']").click
        checkNews.click
        checkOffers.click
        # address
        address_username_input.set @data['firstName']
        address_lastName_input.set @data['lastName']
        address.set @data['address']
        city.set @data['city']
        state.double_click
        find(:xpath, "//select[@id='id_state']/option[text()='#{@data['state']}']").click
        zipcode.set @data['zipcode']
        country.double_click
        find(:xpath, "//select[@id='id_country']/option[text()='#{@data['country']}']").click
        mobilePhone.set @data['mobile']
        addressAlias.set @data['assignAddress']
        btnRegister.click
    end

    def login(user, pass)
        btn_sign_in.click
        login_email.send_keys(user)
        password.send_keys(pass)
        btn_login.click
    end

end