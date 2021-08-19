When('User open browser,navigate to URL and log in as Landlord') do
end

When('User click Add a new location button') do
  $wait.until{$driver.find_element(:xpath,"//a[text()='Add a new location']").displayed? }
  $driver.find_element(:xpath,"//a[text()='Add a new location']").click
end

Then('The Location form open') do
  $wait.until{$driver.find_element(:name,"name").displayed?}
end

And('User enter Location name') do
  $driver.find_element(:name,"name").send_keys(random_name)
end

And('User select Type of your location from drop down') do
  $driver.find_element(:css,".Select__value-container > .Select__placeholder").click
  $wait.until{$driver.find_element(:xpath,"//*[contains(text(),'Malls')]").displayed?}
  $driver.find_element(:xpath,"//*[contains(text(),'Malls')]").click
end

And('User select Country from drop down') do
  $driver.find_element(:css,".select-country > .css-19bqh2r").click
  $wait.until{$driver.find_element(:xpath,"//*[contains(text(),'England')]").displayed?}
  $driver.find_element(:xpath,"//*[contains(text(),'England')]").click
end

And('User select Region from drop down') do
  $driver.find_element(:css,".select-region > .css-19bqh2r").click
  $wait.until{$driver.find_element(:xpath,"//*[contains(text(),'London')]").displayed?}
  $driver.find_element(:xpath,"//*[contains(text(),'London')]").click
end

And('User select City from drop down') do
  $driver.find_element(:css,".select-city > .css-19bqh2r").click
  $wait.until{$driver.find_element(:xpath,"//*[contains(text(),'Westminster')]").displayed?}
  $driver.find_element(:xpath,"//*[contains(text(),'Westminster')]").click
end

And('User enter Address line') do
  $driver.find_element(:css,"input[name='address']").send_keys("138 AnnField Rd")
end

And('User enter Post code') do
  $driver.find_element(:css,"input[name='postCode']").send_keys("CT18 4TP")
end

And('User enter Description') do
  $driver.find_element(:css,"textarea[label='Description*']").send_keys("testing")
end
And('User select Financial year from calendar') do
  $driver.find_element(:css,".form__form-group-datepicker").click
  $driver.find_element(:css,".react-datepicker__day--001").click
end

And('User Upload logo file') do
    $driver.find_element(:id,"logoUpload").send_keys(image_png)
end

And('User Upload images of your location') do
    $driver.find_element(:id,"pictures").send_keys(image_jpg)
end

And('User enter Video links of your location') do
    $driver.find_element(:xpath,"//input[@placeholder='https://vimeo.com/457717076/63ff35fafc'][1]").send_keys("https://vimeo.com/457720587")
end

And('User enter Location virtual tour') do
  $driver.find_element(:name,"virtualTourUrl").send_keys("https://petitegalerie.louvre.fr/visite-virtuelle/saison5/")
end

And('User enter Name your floor plan') do
  $driver.find_element(:xpath,"//div[@style='margin-bottom: 10px;']/input").send_keys("NQ_1")
end

And('User Upload floor plan') do
  $driver.find_element(:id,"floors").send_keys(image_jpg)
  sleep 2
end

And('User click Add floor plan button') do
  $wait.until{$driver.find_element(:xpath,"//*[contains(text(),'Add floor plan')]").displayed? }
  $driver.find_element(:xpath,"//*[contains(text(),'Add floor plan')]").click
end

Then('User click Continue button') do
  $driver.find_element(:name,"submit").click
end

When('User enter Weekly footfall') do
  $wait.until{$driver.find_element(:name,"demographic.weeklyFootfall").displayed? }
  $driver.find_element(:name,"demographic.weeklyFootfall").send_keys("120")
end

And('User enter ABC 1') do
  $driver.find_element(:name,"demographic.abc1").send_keys("50")
end

And('User enter Average dwell time visit') do
  $driver.find_element(:name,"demographic.dwellTime").send_keys("22")
end

And('User enter Average spend per head') do
  $driver.find_element(:name,"demographic.spending").send_keys("79")
end

And('User enter Male') do
  $driver.find_element(:name,"demographic.gender.male").send_keys("65")
end

And('User enter Female') do
  $driver.find_element(:name,"demographic.gender.female").send_keys("35")
end

And('User enter Generation Z') do
  $driver.find_element(:name,"demographic.age.genZ").send_keys("25")
end

And('User enter Generation Y') do
  $driver.find_element(:name,"demographic.age.genY").send_keys("25")
end

And('User enter Generation X') do
  $driver.find_element(:name,"demographic.age.genX").send_keys("20")
end

And('User enter Generation BB') do
  $driver.find_element(:name,"demographic.age.babyBoomer").send_keys("30")
end

Then('User click Save button') do
  $driver.find_element(:name,"submit").click
  sleep 2
end

Then('User click I want to add them later button') do
  $wait.until{$driver.find_element(:xpath,"//span[text()='I want to add them later']").displayed? }
  $driver.find_element(:xpath,"//span[text()='I want to add them later']").click
end

Then('User check if the Location was created') do
  sleep 3
  search_location
  if $wait.until{$driver.find_element(:xpath,"//a[text()='#{$name_location}']").displayed?}
    log "Location was created successfully"
  end
end

