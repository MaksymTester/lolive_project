When(/^Hirer clicks on account username$/) do
  sleep 2
  hey_username=$driver.find_element(:xpath,"//*[@id='root']/div[1]/div/div/div/main/div/header/div[2]/div[3]/div/div[1]/div")
  $wait.until{hey_username.displayed?}
  hey_username.click
end

When(/^Hirer clicks "([^"]*)"$/) do |menu|
  link="//*[text()='#{menu}']"
  $wait.until{$driver.find_element(:xpath,link).displayed?}
  $driver.find_element(:xpath,link).click
end

And(/^Manager clicks edit button near the Staff$/) do
edit="//*[@id='root']/div[1]/div/div/div/main/div/div/div[2]/div/div/div[2]/div[5]/div[2]//*[local-name()='svg'][1]"
$wait.until{$driver.find_element(:xpath,edit).displayed?}
$driver.find_element(:xpath,edit).click
sleep 5
end

When(/^Manager unmark "Can access bookings history" checkbox$/) do
  scroll_down
  booking_history="//*[@id='Access booking history']"
  if $driver.find_element(:xpath,booking_history).selected? == true
    $driver.find_element(:xpath,"//*[@id='root']/div[1]/div/div/div/main/div/div/div[2]/div/div/div[2]/div[8]/div[4]/div/div/label[1]/span[1]").click
       end
  end

When(/^Manager unmark "Can manage a booking" checkbox$/) do
  manage_booking="//*[@id='Manage booking']"
  if $driver.find_element(:xpath,manage_booking).selected? == true
    $driver.find_element(:xpath,"//*[@id='root']/div[1]/div/div/div/main/div/div/div[2]/div/div/div[2]/div[8]/div[4]/div/div/label[2]/span[1]").click
    end
  end

Then(/^Manager save the changes$/) do
  $driver.find_element(:xpath, "//button[text()='Edit']").click
  $wait.until{$driver.find_element(:xpath, "//*[@id='root']/div[1]/div/div/div/main/div/div/div[2]/div/div/div[2]/div[8]/div[5]/button[2]//*[local-name()='svg'][1]").displayed?}
  sleep 2
end

And(/^Manager logs out$/) do
  hey_username=".dropdown"
  $wait.until{$driver.find_element(:css,hey_username).displayed?}
  $driver.find_element(:css,hey_username).click
  log_out="//button[text()='Log out']"
  $wait.until{$driver.find_element(:xpath,log_out).displayed?}
  $driver.find_element(:xpath,log_out).click
  sleep 2
end

When(/^Staff logs in$/) do
  authorization_hirer_staff
end

Then(/^Staff check that "([^"]*)" menu is not present in the left menu$/) do |menu|
  sleep 3
  $wait.until{$driver.find_element(:xpath,"//*[text()='all campaigns']").displayed?}
  begin
  $driver.find_element(:xpath,"//*[text()='#{menu}']").displayed?
  rescue Selenium::WebDriver::Error::NoSuchElementError
    log("Menu is not displayed")
  end
end

When(/^Staff opens the any campaign$/) do
  $wait.until{$driver.find_element(:xpath,"//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div[2]/div/div[2]/a").displayed?}
  $driver.find_element(:xpath,"//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div[2]/div/div[2]/a").click
end

Then(/^Staff check that "([^"]*)" menu is not present under opened campaign$/) do |menu|
  sleep 3
  begin
    $driver.find_element(:xpath,"//*[text()='#{menu}']").displayed?
  rescue Selenium::WebDriver::Error::NoSuchElementError
    log("Menu is not displayed")
  end
end


When(/^Staff opens the campaign planner with added space$/) do
  staff
end

When(/^Staff checks that "([^"]*)" button shouldn't be display for the activity$/) do |book|
  sleep 3
  begin
    $driver.find_element(:xpath,"//button[text()='#{book}']")
    fail("Staff cannot make a booking without access")
  rescue Selenium::WebDriver::Error::NoSuchElementError
    log("Staff cannot make booking as no access was provided")
  end
end