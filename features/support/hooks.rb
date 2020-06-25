require 'dotenv'
require 'report_builder'
require 'date'
Dotenv.load
logs_folder_path = logs_folder

Before do
@login = LoginPage.new
@home = HomePage.new
@history = OrderHistoryPage.new
end

Before('@login') do
    @login.login_with(ENV['EMAIL'], ENV['PASS'])
end

After do |scenario|    
    temp_shot = page.save_screenshot("#{logs_folder_path}/#{scenario.name}.png")
    shot = Base64.encode64(File.open(temp_shot, 'rb').read)
    embed(shot, 'image/png', 'Evidencia')    
end

at_exit do
        report_path = "#{logs_folder_path}/report"
        ReportBuilder.configure do |config|
            config.input_path = 'logs/report.json'
            config.report_path = report_path
            config.report_types = [:html]
            config.report_tabs = %w[Overview Features Scenarios Errors]
            config.report_title = 'TS'
            config.compress_images = true
            config.additional_info = { 'Sistema' => 'Test', 'Plataforma' => 'Web', 'Execucao' => DateTime.now.new_offset(Rational(-3, 24)).to_s }
            config.color = 'indigo'
        end
        ReportBuilder.build_report
        save_report_snapshot("#{report_path}.html")
    end