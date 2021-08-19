When('User click Go search') do
  sleep 2
  hey_username=$driver.find_element(:xpath,"//*[@id='root']/div[1]/div/div/div/main/div/header/div[2]/div[3]/div/div[1]/div")
  $wait.until{hey_username.displayed?}
  hey_username.click
  go_search=$driver.find_element(:xpath,"//*[@class='dropdown-item' and text()='Go search']")
  $wait.until{go_search.displayed?}
  go_search.click
  sleep 2
  go_search_menu=$driver.find_element(:xpath,"//*[@id='root']/div[1]/div/div/div/main/div/div[1]/div[1]/div[2]/a")
  $wait.until{go_search_menu.displayed? }
  go_search_menu.click
end

Then('User is redirected to search page') do
  if $wait.until { $driver.find_element(:css, ".select-purpose__in-2 > .css-19bqh2r").displayed? }
  end
end

When('User click What drop-down') do
  begin
  $driver.find_element(:css,".select-purpose__in-2 > .css-19bqh2r").click
  rescue
    $driver.find_element(:css,"#purpose").click
  end
end

Then(/^What drop-down list open and user select a value "([^"]*)"$/) do |value|
  begin $wait.until{$driver.find_element(:xpath,"//*[contains(text(),'#{value}')]").displayed?}
      $driver.find_element(:xpath,"//*[contains(text(),'#{value}')]").click
  rescue
      fail("#{value} is not exist in the list")
  end
  end

When('User click Start field') do
  $driver.find_element(:css,"[placeholder='Start date']").click
end

Then('Calendar picker open and user select the Start date') do
  $driver.find_elements(:xpath,"//div[@aria-disabled='false']").first.click
end

When('User click End field') do
  $driver.find_element(:css,"[placeholder='End date']").click
end

Then('Calendar picker open and user select the End date') do
  $driver.find_elements(:xpath,"//div[@aria-disabled='false']").first.click
end

When('User click Where drop-down') do
  $driver.find_element(:xpath,"//a[@class='dropdown-trigger arrow bottom']").click
end

Then('Where drop-down list open and user select a value') do
  $wait.until{$driver.find_element(:xpath,"//*[@class='node-label' and text()='England']").displayed? }
  $driver.find_element(:xpath,"//*[@class='node-label' and text()='England']").click
end

When(/^User click on "([^"]*)" checkbox$/) do |value|
  internal_external=$driver.find_element(:xpath,"//*[text()='#{value}']")
  internal_external.click
end

And('User input space Width') do
  $driver.find_element(:id,"width__gte").send_keys("1")
end

And('User input space Length') do
  $driver.find_element(:id,"length__gte").send_keys("1")
end

And('User click Go search button') do
  $driver.find_element(:css,"[type='submit']").click
end

Then('Search is performed and location list is displayed') do
  if $wait.until { $driver.find_element(:css, ".results-block__message").displayed? }
  end
end


Then(/^I click 'Go Search' button$/) do
  $driver.find_element(:css,".go-search-btn").click
end

Then(/^User see the validation message "([^"]*)"$/) do |text|
  if $wait.until {$driver.find_element(:xpath,"//*[text()='#{text}']").displayed?}
    log "Not all the required fields are filled in"
  end
end

When(/^User enter "([^"]*)" to 'Search location' field$/) do |value|
  $driver.execute_script("window.scrollTo(20, document.body.scrollHeight/4.5)")
  $driver.find_element(:xpath,"//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div[1]/div/div[2]/div[2]/div/div/div/input").send_keys(value)

end

And(/^User select "([^"]*)" from the suggestion list$/) do |value|
  sleep 1
  $wait.until{$driver.find_element(:xpath,"//*[text()='#{value}']").displayed?}
  $driver.find_element(:xpath,"//*[text()='#{value}']").click
  end

Then(/^User is redirected to the 'Westfield London' location page$/) do
  sleep 10
  $driver.switch_to.window($driver.window_handles[1])
  url=$driver.current_url
  link = "https://lola-protected:LoLa_Access_4_Devsonly@app-staging.locationlive.co.uk/location/westfield-london"
  if url == link
  else
    fail("Wrong page is opened")
    log $driver.current_url
    end
end