class LoginPage  < SitePrism::Page  
    
    def load
        visit ENV['DEFAULT_URL']
    end

    def login_with(user, pass)
        load
        find('.login').click
        find('#email').set user
        find('#passwd').set pass
        find('#SubmitLogin').click
    end
end