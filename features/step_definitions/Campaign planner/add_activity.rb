
Given(/^User log in as Hirer and navigate to Campaign planner id '203' \(Location: '1704' Test, Space: Space change was added\)$/) do
  sleep 3
  $driver.get('https://lola-protected:LoLa_Access_4_Devsonly@app-staging.locationlive.co.uk/planner/203')
end

When(/^User check if the activity was added, he deletes it$/) do
  $driver.manage.timeouts.implicit_wait = 4
  sleep 3
  begin
  until $driver.find_element(:xpath,"//button[contains(text(),'Delete')]").displayed?!=true do
  delete_button = $driver.find_element(:xpath,"//button[contains(text(),'Delete')]")
  $driver.action.move_to(delete_button).perform
  $wait.until{delete_button.displayed?}
  delete_button.click
  $yes_button=$driver.find_element(:xpath,"//*[@class='modal-content']/div[2]/button[contains(text(),'Yes')]")
  $wait.until{$yes_button.displayed?}
  $yes_button.click
  sleep 3
  end
  rescue
  end
  end

When(/^User click "([^"]*)" or "([^"]*)" button$/) do |button1, button2|
  $driver.manage.timeouts.implicit_wait = 7
  scroll_up
  begin
    $wait.until{$driver.find_element(:xpath,"//*[text()='#{button1}']").displayed?}
    $driver.find_element(:xpath,"//*[text()='#{button1}']").click
  rescue
    $wait.until{$driver.find_element(:xpath,"//*[text()='#{button2}']").displayed?}
    $driver.find_element(:xpath,"//*[text()='#{button2}']").click
  end
  end

Then(/^The calendar page is opened$/) do
  sleep 2
  $wait.until{$driver.find_element(:xpath,"//*[contains(text(),'Select dates for')]").displayed?}
end

And(/^User click "([^"]*)" button$/) do |button|
  $driver.manage.timeouts.implicit_wait = 5
  begin
    $driver.find_element(:xpath,"//button[text()='#{button}']").enabled?
    $driver.find_element(:xpath,"//button[text()='#{button}']").click
  rescue
    fail("#{button} is not clickable")
  end
  end

And(/^User clicks the "([^"]*)" button$/) do |button|
  $driver.manage.timeouts.implicit_wait = 10
  sleep 5
  b=$driver.find_element(:xpath,"//button[contains(text(),'#{button}')]")
  $driver.action.move_to(b).perform
  $wait.until{b.displayed?}
  sleep 1
  b.click
  sleep 2
end

And(/^User click 'Delete' button and confirm in pop-up$/) do
    $wait.until{$yes_button.displayed?}
    $yes_button.click
  end


Then(/^Page which contain "([^"]*)" text is opened$/) do |text|
  $driver.manage.timeouts.implicit_wait = 7
  $wait.until{$driver.find_element(:xpath,"//*[contains(text(),'#{text}')]").displayed?}
  scroll_down
end

And(/^User see the text "([^"]*)" submitted$/) do |text|
  $wait.until{$driver.find_element(:xpath,"//*[text()='#{text}']").displayed?}
end

Then(/^User select available days in the calendar$/) do
  $driver.manage.timeouts.implicit_wait = 3
  sleep 3
  calendar
end

Then(/^Click "([^"]*)" button in the confirmation pop-up$/) do |button|
  $wait.until{$driver.find_element(:xpath,"//*[@class='modal-content']/div[2]/button[contains(text(),'#{button}')]").displayed?}
  $driver.find_element(:xpath,"//*[@class='modal-content']/div[2]/button[contains(text(),'#{button}')]").click
  $driver.manage.timeouts.implicit_wait = 7
end

Then(/^User mark the 'I agreed to the Specifics of Hire and the Booking terms' checkbox$/) do
  $wait.until{$driver.find_element(:xpath,"//*[@for='terms']/span").displayed?}
  $driver.find_element(:xpath,"//*[@for='terms']/span").click
end

And(/^User see the text "([^"]*)"$/) do |text|
  $driver.manage.timeouts.implicit_wait = 5
  $wait.until{$driver.find_element(:xpath,"//*[text()='#{text}']").displayed?}
end
