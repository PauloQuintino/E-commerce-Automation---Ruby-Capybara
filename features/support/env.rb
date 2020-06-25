require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require_relative 'page_helper.rb'
require_relative 'helper.rb'
require_relative 'utils.rb'


# Global modules
World(Helper)

# constants
BROWSER = ENV['BROWSER']


execution_time = execution_time_str()
$logs_folder = "logs/#{execution_time}"
create_path($logs_folder)

def logs_folder()
    $logs_folder
end

# Setting up the chosen driver 
Capybara.register_driver :selenium do |app|

    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--start-maximized')

    if BROWSER.eql?('chrome')
        Capybara::Selenium::Driver.new(app, :browser => :chrome,
        options:options
    )
    elsif BROWSER.eql?('firefox')
        Capybara::Selenium::Driver.new(app, :browser => :firefox)
    elsif BROWSER.eql?('chrome_headless')
        Capybara::Selenium::Driver.new(app, :browser => :chrome,
            desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
                'chromeOptions' => {'args' => ['--headless','disable-gpu']}
        ))
    end
end

# Setting up driver
Capybara.configure do |config|
    config.default_driver = :selenium
    config.default_max_wait_time = 10
end
