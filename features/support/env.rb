require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'capybara/rspec'
require 'dotenv'
require 'selenium-webdriver'
require 'site_prism'
require 'byebug'
require 'capybara-screenshot/cucumber'

Dotenv.load
browser = ENV['BROWSER'].to_sym
base_url = ENV['BASE_URL']
wait_time = 10
@report_root =  File.absolute_path('./report')
path = "#{@report_root}/report"
FileUtils.mkdir_p path
options = Selenium::WebDriver::Chrome::Options.new

Capybara.register_driver :chrome do |app|
    options.add_argument('--user-agent=selenium')
    options.add_argument('--start-maximized')
    client = Selenium::WebDriver::Remote::Http::Default.new
    caps = Selenium::WebDriver::Remote::Capabilities.chrome(
      proxy: nil,
      page_load_strategy: 'none'
    )
    client.open_timeout = wait_time
    client.read_timeout = wait_time
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      options: options,
      http_client: client,
      # profile: profile,
      desired_capabilities: caps
    )
  end

  Capybara::Screenshot.register_driver(browser) do |driver, location|
    driver.browser.save_screenshot location
  end

  Capybara.default_driver = browser

  Capybara.save_path = "#{path}/screenshots"