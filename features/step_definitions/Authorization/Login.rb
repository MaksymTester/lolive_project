Given('User opens browser,navigate to URL') do
end

When(/^User enter "([^"]*)" email address$/) do |target|
  $driver.find_element(:id,"sign-in-popover").click
  $driver.find_element(:name,"email").send_keys("#{target}")
end

When(/^User enter "([^"]*)" password$/) do |target|
  $driver.find_element(:name,"password").send_keys("#{target}")
end

Then('User click Sign in button') do
  $driver.find_element(:xpath,"//button[text()='Login']").click
  $wait.until{$driver.find_element(:xpath,"//*[contains(text(),'Hey')]").displayed?}
end