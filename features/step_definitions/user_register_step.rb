user_register_page = UserRegisterPage.new

# registration
Given('I access the website') do
    user_register_page.load_page  
end

When('sign in passing all data:') do |table|
    user_register_page.userRegistration
    user_register_page.fillRegistrationForm(table)
end

Then('the registration should be successfully realized') do
    registerValidation = find('.info-account')
    expect(registerValidation.text).to eq 'Welcome to your account. Here you can manage all of your personal information and orders.'
    log("#{registerValidation.text}")
    sleep(2)
end
