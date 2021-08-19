Given(/^Space Change space of 1704 Test location is opened$/) do
  sleep 4
  $driver.get('https://lola-protected:LoLa_Access_4_Devsonly@app-staging.locationlive.co.uk/location/1704-test/space/space-change')
  sleep 10
end

When(/^User clicks "([^"]*)" button$/) do |arg|
  $wait.until{$driver.find_element(:css,"[class='Button Button--big']").displayed?}
  $driver.find_elements(:css,"[class='Button Button--big']").first.click
end

Then(/^Page scrolls to the beginning of space calendar$/) do
  $wait.until{$driver.find_element(:css,"#get-this-space").displayed?}
end

When(/^User enter text to "([^"]*)" field$/) do |arg|
  $driver.execute_script("window.scrollTo(20, document.body.scrollHeight/4.5)")
  sleep 5
  $driver.find_element(:xpath,"//input[@name='name']").send_keys(random_name)
end

Then(/^User click Sector drop-down$/) do
  $driver.find_element(:css,"#sector").click
end

And(/^Sector drop-down list opens and user select a value "([^"]*)"$/) do |value|
  begin $wait.until{$driver.find_element(:xpath,"//*[contains(text(),'#{value}')]").displayed?}
  $driver.find_element(:xpath,"//*[contains(text(),'#{value}')]").click
  rescue
    fail("#{value} is not exist in the list")
  end
end

Then(/^User enters text to "([^"]*)" field$/) do |field|
  $driver.find_element(:css, "[placeholder='#{field}']").send_keys(random_name)
end