require 'date'

def save_report_snapshot(html_report_path)
    Capybara.current_session.driver.visit File.absolute_path(html_report_path)
    report_snapshot = html_report_path.gsub("html", "png")
    Capybara.current_session.driver.find_css("div#overview")
    Capybara.current_session.driver.save_screenshot(report_snapshot)
end

def execution_time_str
    t = Time.new
    return t.strftime("%d%m%Y%k%M%S")
end

def create_path(path)
    FileUtils.mkdir_p path unless File.exists?(path)
end