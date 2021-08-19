Given('User open browser,navigate to URL,log in as Landlord,open Location and start edit the Space') do
  sleep 4
  $driver.get('https://lola-protected:LoLa_Access_4_Devsonly@app-staging.locationlive.co.uk/location/1704-test/listings')
  sleep 3
  $edit="//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div[6]/div[1]/div[1]/div[7]/div/*[local-name()='svg'][1]"
  $wait.until{$driver.find_element(:xpath,$edit).displayed?}
  sleep 3
  $driver.find_element(:xpath,$edit).click

end

When('User click Space name field and enter new Space name') do
  $wait.until{$driver.find_element(:name,"name").displayed? }
  $driver.find_element(:name,"name").clear
  $driver.find_element(:name,"name").send_keys("NewSpaceQA")
end

And('User change the Type of space') do
    $driver.find_element(:css,"[class='radio ']").click
end

And('User enter new value in width for Space size') do
  $driver.find_element(:name,"dimension.width").clear
  $driver.find_element(:name,"dimension.width").send_keys("20")
end

And('User enter new in length for Space size') do
  $driver.find_element(:name,"dimension.length").clear
  $driver.find_element(:name,"dimension.length").send_keys("10")
end

And('User enter new in height for Space size') do
  $driver.find_element(:name,"dimension.height").clear
  $driver.find_element(:name,"dimension.height").send_keys("5")
end

Then('User clicks Save button') do
  $driver.find_element(:css,"[value='Save']").click
  sleep 5
end

Then('User clicks Edit button near space') do
  sleep 2
  $wait.until{$driver.find_element(:xpath,$edit).displayed?}
  $driver.find_element(:xpath,$edit).click
  sleep 3

end

Then('User check if new data was saved in the fields') do
    $wait.until{$driver.find_element(:name,"name").displayed? }
    $driver.find_element(:css,"[value='NewSpaceQA']").displayed?
    $driver.find_element(:css,"[class='radio radio--checked']").selected?
    $driver.find_element(:xpath,"//input[@name='dimension.width' and @value='20']").displayed?
    $driver.find_element(:xpath,"//input[@name='dimension.length' and @value='10']").displayed?
    $driver.find_element(:xpath,"//input[@name='dimension.height' and @value='5']").displayed?
    log "new data is displayed"
end
