Before do |scenario|
    Capybara.app_host = ENV['BASE_URL']
    Capybara.default_max_wait_time = 30
    Capybara.javascript_driver = ENV['BROWSER'].to_sym

    @driver = page.driver
    @app = InitializePages.new
  
    Capybara.current_session.driver.browser.manage.delete_all_cookies
    # visit ENV['BASE_URL']
    sleep 3
  end