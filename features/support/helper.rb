module Helper
    def take_print(archive_name, result_test)
        archive_folder = "report/screenshots/test_#{result_test}"
        picture = "#{archive_folder}/#{archive_name}.png"
        page.save_screenshot(picture)
        attach(picture, 'image/png')
    end
end