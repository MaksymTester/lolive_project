Given('User open browser,navigate to URL and open Registration form page') do
end

When('User enter First Name') do
  $driver.find_element(:id,"sign-in-popover").click
  $driver.find_element(:xpath, "//button[text()='Sign up']").click
  $wait.until{$driver.find_element(:name,"firstName").displayed? }
  $driver.find_element(:name,"firstName").send_keys("Test23453")
end

When('User enter Last Name') do
  $driver.find_element(:name,"lastName").send_keys("LoLiver")
end

When('User enter Job Title') do
  $driver.find_element(:name,"jobTitle").send_keys("QA")
end

When('User enter Business number') do
  $driver.find_element(:css,".form-control").send_keys("+9345645646546")
end

When('User enter Business email') do
  $driver.find_element(:name,"email").send_keys(email_address)
  #log email_address
end

When('User enter new password to Create password field') do
  $driver.find_element(:name,"password").send_keys("Test1234!qwerty")
end

When('User enter same password to Confirm field') do
  $driver.find_element(:name,"passwordConfirm").send_keys("Test1234!qwerty")
end

When('User enter Company Name') do
  $driver.find_element(:name,"company.name").send_keys(random_name)
end

When('User select Business Type from drop down list') do
  $driver.find_element(:css,".Select__value-container").click
  $driver.find_element(:id,"react-select-3-option-1").click
end

Then('User click Sign up button') do
  $wait.until{$driver.find_element(:css,"[type='submit']").displayed? }
  $driver.find_element(:css,"[type='submit']").click
  $wait.until{$driver.find_element(:xpath,"//*[text()='thank you, ']").displayed?}
end