Given('User open browser,navigate to URL,log in as Landlord') do
  sleep 3
end

When('User clicks on location') do
  begin
  search_location
  $wait.until{$driver.find_element(:xpath,"//*[contains(text(),'#{$name_location}')]").displayed? }
  $driver.find_element(:xpath,"//*[contains(text(),'#{$name_location}')]").click
  rescue
    sleep 2
    $driver.get('https://lola-protected:LoLa_Access_4_Devsonly@app-staging.locationlive.co.uk/location/1704-test/listings')
    sleep 10
    end
end

When('User clicks on listing menu') do
  $wait.until{$driver.find_element(:xpath,"//div[text()='listings']").displayed? }
  $driver.find_element(:xpath,"//div[text()='listings']").click
  sleep 2
end

When('User clicks Add a new space button') do
  sleep 3
  $wait.until{$driver.find_element(:xpath,"//button[text()='Add a new space']").displayed? }
  $driver.find_element(:xpath,"//button[text()='Add a new space']").click
end

Then('New space form displays') do
  sleep 3
  $wait.until{$driver.find_element(:name,"name").displayed? }
end

When('User enter Space name') do
  $driver.find_element(:name,"name").send_keys("QASpace")
end

And('User select Type of space') do
  $driver.find_element(:xpath,"//span[@class='label' and text()='Internal']").click
end

And('User enter width for Space size') do
  $driver.find_element(:name,"dimension.width").send_keys("30")
end

And('User enter length for Space size') do
  $driver.find_element(:name,"dimension.length").send_keys("20")
end

And('User enter height for Space size') do
  $driver.find_element(:name,"dimension.height").send_keys("5")
end

And('User select Use of space from drop-down') do
  $driver.find_element(:css,".Select__value-container > .select-purposes").click
  $driver.find_element(:xpath,"//*[text()='Event']").click
end

And('User select In proximity from drop-down') do
  $driver.find_element(:css,".Select__value-container > .select-proximity").click
  $driver.find_element(:xpath,"//*[text()='Transport']").click
end

And('User enter Neighbours') do
  $driver.find_element(:name,"neighbours").send_keys("Apple")
end

And('User enter Brief description') do
  $driver.find_element(:css,"[label='Brief description*']").send_keys("Random text")
end

And('User select Opening hours on Monday \(From and To)') do
  $driver.find_element(:css,".select-monday-from > .Select__value-container").click
  $driver.find_element(:xpath,"//*[text()='0:30 AM']").click
  $driver.find_element(:css,".select-monday-to > .Select__value-container").click
  $driver.find_element(:xpath,"//*[text()='4:00 AM']").click
end

And('User select Opening hours on Tuesday \(From and To)') do
  $driver.find_element(:css,".select-tuesday-from > .Select__value-container").click
  $driver.find_element(:xpath,"//*[text()='2:00 AM']").click
  $driver.find_element(:css,".select-tuesday-to > .Select__value-container").click
  $driver.find_element(:xpath,"//*[text()='3:00 AM']").click
end

And('Mark checkbox closed for Wednesday') do
  $driver.find_element(:xpath,"//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div/div/form/div[12]/div[1]/div[3]/div/div[1]/label/span[1]").click
end

And('Mark checkbox closed for Thursday') do
  $driver.find_element(:xpath,"//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div/div/form/div[12]/div[1]/div[4]/div/div[1]/label/span[1]").click
end

And('Mark checkbox closed for Friday') do
  $driver.find_element(:xpath,"//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div/div/form/div[12]/div[2]/div[1]/div/div[1]/label/span[1]").click
end

And('Mark checkbox closed for Saturday') do
  $driver.find_element(:xpath,"//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div/div/form/div[12]/div[2]/div[2]/div/div[1]/label/span[1]").click
end

And('Mark checkbox closed for Sunday') do
  $driver.find_element(:xpath,"//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div/div/form/div[12]/div[2]/div[3]/div/div[1]/label/span[1]").click
end

And('User Upload siteplan .pdf file') do
  $driver.find_element(:id,"technicalPlanUpload").send_keys(image_pdf)
end

And('User Upload logo file of brands') do
  $driver.find_element(:id,"tmpbrands.file").send_keys(image_png)
end

And('User clicks Add button after uploading logo file') do
  $wait.until{$driver.find_element(:xpath,"//input[contains(@value,'png')]").displayed? }
  $driver.find_element(:xpath,"//button[@color='primary']").click
end

And('User select Locate your space on the floorplans from drop-down') do
  $driver.find_element(:css,".select-floor > .Select__value-container").click
  $driver.find_element(:xpath,"//*[text()='NQ_1']").click
end

And('User Upload images of the space') do
  $driver.find_element(:id,"pictures").send_keys(image_jpg)
end

And('User Upload install pack of this space') do
  $driver.find_element(:id,"installPackUpload").send_keys(image_pdf)
  $wait.until{$driver.find_element(:css,"[class='preview-name']").displayed? }
end

And('User enter Virtual link') do
  $driver.find_element(:name,"virtualTourUrl").send_keys("http://www.vtility.net/virtualtour/national-gallery-of-australia")
end

Then('User clicks Continue button') do
  $driver.find_element(:name,"submit").click
end

Then('Rules of the space page opens') do
  $wait.until{$driver.find_element(:xpath,"//div[@value='yes']").displayed? }
end

When('User selects Do weekend bookings include friday? option') do
  $driver.find_element(:xpath,"//div[@value='yes']").click
end

And('User enters Please state the Terms and Conditions of this space field') do
  $driver.find_element(:xpath,"//textarea[@placeholder='Type something']").send_keys("Terms&Conditions")
end

Then('User clicks Continue button on the 2nd page') do
  $driver.find_element(:name,"submit").click
end

Then('Rate card page opens') do
  $wait.until{$driver.find_element(:css,"[name='rateCard.daily']").displayed? }
end

When('User enters Daily rate') do
  $driver.find_element(:css,"[name='rateCard.daily']").send_keys("1000")
end

And('User enters Weekly rate') do
  $driver.find_element(:css,"[name='rateCard.weekly']").send_keys("1600")
end

Then('User clicks Continue button on the 3rd page') do
  $driver.find_element(:xpath,"//input[@type='submit']").click
end

Then('User clicks Go to Publish button') do
  $wait.until{$driver.find_element(:xpath,"//button[text()='Go to publish']").displayed? }
  $driver.find_element(:xpath,"//button[text()='Go to publish']").click
end

Then('User check if the Space was created') do
  $wait.until{$driver.find_element(:xpath,"//*[text()='QASpace']").displayed? }
  log "Space was created successfully"
end
