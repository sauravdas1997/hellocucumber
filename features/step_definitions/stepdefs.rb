def first_type(driver)
  sleep(1)
  prod_sec_xpath = '//div[@class="_1YokD2 _3Mn1Gg"]'
  prod_sec = driver.find_element(:xpath, prod_sec_xpath)
  all_prod_xpath = '_1AtVbE'
  all_prod = prod_sec.find_elements(:class, all_prod_xpath)
  inner_div = all_prod[2].find_element(:class, '_13oc-S')
  prod = inner_div.find_element(:tag_name, :div)
  meta_data = prod.find_element(:class, '_3pLy-c')
  prod_data = meta_data.find_element(:tag_name, :div).text.split("\n")
  prod_data[0]
  
end

def second_type(driver)
  sleep(1)
  prod_sec_xpath = '//div[@class="_1YokD2 _3Mn1Gg"]'
  prod_sec = driver.find_element(:xpath, prod_sec_xpath)

  all = prod_sec.find_elements(:class, '_1AtVbE')
  prod = all[1].find_element(:tag_name, :div).find_element(:tag_name, :div)

  prod_data = prod.text.split("\n")
  if prod_data[0] == 'Ad'
    prod_data[2]
  else
    prod_data[1]
  end
end

Given('Text to seach is {string}') do |text_to_search|
  require 'selenium-webdriver'
  Selenium::WebDriver::Chrome::Service.driver_path = '/Users/saurav/Home/autoamtion_project/hellocucumber/chromedriver'
  @driver = Selenium::WebDriver.for :chrome
  @driver.manage.timeouts.implicit_wait = 5
  @driver.manage.window.maximize

  # load page
  @driver.get('https://www.flipkart.com')

  popup_elem_xpath = '//button[@class="_2KpZ6l _2doB4z"]'
  popup_elem = @driver.find_element(:xpath, popup_elem_xpath)
  popup_elem.click

  searchbox_xpath = '//input[@class="_3704LK"]'
  @driver.find_element(:xpath, searchbox_xpath).send_keys text_to_search.to_s
  @driver.action.send_keys(:return).perform
  @driver.find_element(:xpath, searchbox_xpath).clear
end

When('Text is searched, where type is {string}') do |type|
  @prod_name = if type == '1'
                 first_type(@driver)
               else
                 second_type(@driver)
               end
end

Then('I should get first produce name as {string}') do |expected|
  expect(@prod_name.class).to eq(expected.class)
end
