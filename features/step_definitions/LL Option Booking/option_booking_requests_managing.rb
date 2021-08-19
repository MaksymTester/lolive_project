Given(/^LL lands on the Booking page of 1704 Test location$/) do
  sleep 3
  $driver.get('https://lola-protected:LoLa_Access_4_Devsonly@app-staging.locationlive.co.uk/location/1704-test/bookings')
end

Given(/^LL lands on the Option page of 1704 Test location$/) do
  sleep 3
  $driver.get('https://lola-protected:LoLa_Access_4_Devsonly@app-staging.locationlive.co.uk/location/1704-test/options')
end

When(/^User click the "([^"]*)" button$/) do |button|
  b="//*[text()='#{button}']"
  begin
  $wait.until{$driver.find_element(:xpath,b).displayed?}
  $driver.find_element(:xpath,b).click
  rescue
    fail("No booking requests exist")
    end
end

And(/^Confirm the validation by clicking "([^"]*)" button in the modal window$/) do |button|
  modal=$wait.until{$driver.find_element(:xpath,"//*[contains(text(),'Are you sure you want to validate')]").displayed?}
  if modal==true
    $driver.find_element(:xpath,"//button[text()='#{button}']").click
  else
    fail("Modal is not opened")
  end
end

Then(/^Booking transfers to the Active tab$/) do
  $driver.find_element(:xpath,"//button[text()='Show external bookings']").click
  $wait.until{$driver.find_element(:xpath,"//*[text()='BOOKED']").displayed?}
end

Then(/^Option transfers to the Active tab$/) do
  $wait.until{$driver.find_element(:xpath,"//*[contains(text(),'Option - Ref')]").displayed?}
end
