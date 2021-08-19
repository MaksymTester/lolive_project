Given(/^LL lands on the calendar page of 1704 Test location$/) do
    sleep 3
    $driver.get('https://lola-protected:LoLa_Access_4_Devsonly@app-staging.locationlive.co.uk/location/1704-test/calendar')
  end

When(/^LL clicks "([^"]*)" button$/) do |button|
  b="//*[text()='#{button}']"
  $wait.until{$driver.find_element(:xpath,b).displayed?}
  $driver.find_element(:xpath,b).click
end

Then(/^Choose date FROM in the calendar picker$/) do
  $wait.until{$driver.find_element(:css,"[placeholder='From']").displayed?}
  $driver.find_element(:css,"[placeholder='From']").click
  $from = $driver.find_elements(:xpath,"//div[@aria-disabled='false']").first.text
  $driver.find_elements(:xpath,"//div[@aria-disabled='false']").first.click
end

And(/^Choose date TO in the calendar picker$/) do
  $driver.find_element(:css,"[placeholder='To']").click
  $to=$driver.find_elements(:xpath,"//div[@aria-disabled='false']").first.text
  $driver.find_elements(:xpath,"//div[@aria-disabled='false']").first.click

end

Then(/^LL mark the 'Option' checkbox$/) do
  option="//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div/form/div/div[3]/div/div/label[2]/span[1]"
  $driver.find_element(:xpath,option).click
  $driver.find_element(:xpath,option).selected?
end

Then(/^LL click What drop-down$/) do
  $driver.find_element(:xpath,"//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div/form/div/div[4]/div/div/div[2]/div").click
  sleep 1
end

Then(/^Mark any available Space for selected dates$/) do
  begin
    $driver.execute_script("window.scrollTo(20, document.body.scrollHeight/1.9)")
    sleep 2
  $driver.find_elements(:class,"checkbox-btn__checkbox-custom").last.click
  sleep 1
  rescue
    scroll_up
    $wait.until{$driver.find_element(:css,"[placeholder='From']").displayed?}
    $driver.find_element(:css,"[placeholder='From']").click
    $driver.find_element(:css,"[class='react-datepicker__navigation react-datepicker__navigation--next']").click
    $from = $driver.find_elements(:xpath,"//div[@aria-disabled='false']").last.text
    $driver.find_elements(:xpath,"//div[@aria-disabled='false']").last.click

    $driver.find_element(:css,"[placeholder='To']").click
    $driver.find_element(:css,"[class='react-datepicker__navigation react-datepicker__navigation--next']").click
    $to=$driver.find_elements(:xpath,"//div[@aria-disabled='false']").last.text
    $driver.find_elements(:xpath,"//div[@aria-disabled='false']").last.click

    $driver.execute_script("window.scrollTo(20, document.body.scrollHeight/1.9)")
    sleep 2
    $driver.find_elements(:class,"checkbox-btn__checkbox-custom").last.click
    sleep 1
    end
  end

When(/^LL open option menu and go to Active tab$/) do
  sleep 3
  option="//*[@id='root']/div[1]/div/div/div/main/div/div[1]/div[2]/div/div/div[1]/div[1]/div/div/div/a[5]/div"
  $wait.until{$driver.find_element(:xpath,option).displayed?}
  $driver.find_element(:xpath,option).click
  active = "//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div[2]/div[1]/div/button[2]"
  $wait.until{$driver.find_element(:xpath,active).displayed?}
  $driver.find_element(:xpath,active).click
  sleep 2
end

Then(/^Check if Option with selected dates display$/) do
  $driver.find_element(:xpath, "//*[contains(text(),'#{$from}')]").displayed?
  $driver.find_element(:xpath, "//*[contains(text(),'#{$to}')]").displayed?
end

And(/^LL scroll down and clicks "([^"]*)" button$/) do |button|
  scroll_down
  b="//*[@value='#{button}']"
  $wait.until{$driver.find_element(:xpath,b).displayed?}
  $driver.find_element(:xpath,b).click
end

Then(/^LL mark the 'Booking' checkbox$/) do
  booking="//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div/form/div/div[3]/div/div/label[1]/span[1]"
  $driver.find_element(:xpath,booking).click
  $driver.find_element(:xpath,booking).selected?
end

When(/^LL open bookings menu and go to Active tab$/) do
  sleep 3
  bookings="//*[@id='root']/div[1]/div/div/div/main/div/div[1]/div[2]/div/div/div[1]/div[1]/div/div/div/a[6]/div"
  $wait.until{$driver.find_element(:xpath,bookings).displayed?}
  $driver.find_element(:xpath,bookings).click
  active = "//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div[2]/div[1]/div/button[2]"
  $wait.until{$driver.find_element(:xpath,active).displayed?}
  $driver.find_element(:xpath,active).click
  sleep 2
end

Then(/^Check if Booking with selected dates display$/) do
  $driver.find_element(:xpath, "//*[contains(text(),'#{$from}')]").displayed?
  $driver.find_element(:xpath, "//*[contains(text(),'#{$to}')]").displayed?
end

Then(/^LL mark the 'Just a calendar note' checkbox$/) do
  note="//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div/form/div/div[3]/div/div/label[3]/span[1]"
  $driver.find_element(:xpath,note).click
  $driver.find_element(:xpath,note).selected?
end

Then(/^LL enter "([^"]*)" text to Add note field$/) do |text|
  add_note="[label='Add note']"
  $wait.until{$driver.find_element(:css,add_note).displayed?}
  $driver.find_element(:css,add_note).send_keys(text)
end

Then(/^Calendar page is opened$/) do
  $wait.until{$driver.find_element(:xpath,"//*[text()='Create new activity']").displayed?}
end