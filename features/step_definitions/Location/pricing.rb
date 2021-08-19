require 'pry'

Given(/^LL navigates to Test Purpose location$/) do
  sleep 3
  $driver.get('https://lola-protected:LoLa_Access_4_Devsonly@app-staging.locationlive.co.uk/pricing/test-purpose')
  $wait.until{$driver.find_element(:xpath,"//*[text()='Adjust your prices']").displayed?}
end

When(/^LL clicks 'Select space' drop-down$/) do
  my_element = $driver.find_element(:xpath, "//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div[4]/div[2]/div/div[1]/div[2]/div/div[1]/div[1]")
  $driver.action.move_to(my_element).perform
  my_element.click
  sleep 1
end

Then(/^LL select "([^"]*)" space$/) do |space|
  $wait.until{$driver.find_element(:xpath,"//*[text()='#{space}']").displayed?}
  $driver.find_elements(:xpath,"//*[text()='#{space}']").last.click
end

When(/^LL clicks "([^"]*)" field$/) do |field|
  $driver.find_element(:xpath,"//*[@placeholder='#{field}']").click
end

Then(/^LL select any date$/) do
  $driver.find_elements(:xpath,"//*[@aria-disabled='false']").last.click
end

And(/^LL checks if blocks for rate appears$/) do
  $start_day= $driver.find_element(:xpath,"//*[@placeholder='Start date']").attribute("value").to_i
  $end_day= $driver.find_element(:xpath,"//*[@placeholder='End date']").attribute("value").to_i
  puts $start_day
  puts $end_day
  begin
    $wait.until{$driver.find_element(:xpath,"//*[text()='Day rate']").displayed?}
    rescue
    fail("No Day Rate block")
  end
end

When(/^LL enters "([^"]*)" to Percentage field of Day rate$/) do |number|
  day_rate_price = $driver.find_element(:xpath, "//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div[4]/div[2]/div[2]/div[1]/div[3]/div[1]/input").attribute("value").to_i
  $driver.find_element(:xpath, "//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div[4]/div[2]/div[2]/div[1]/div[3]/div[3]/input").send_keys(number)
  $percent = number.to_i
  day_rate_price_with_percent = (day_rate_price * number.to_i/100) + day_rate_price
  $new_price = $driver.find_element(:xpath, "//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div[4]/div[2]/div[2]/div[1]/div[3]/div[1]/input").attribute("value").to_i
  puts $new_price
  if day_rate_price_with_percent == $new_price
  else
    log "Rate price now is #{$new_price}"
  end
end

And(/^LL checks if price was adjusted$/) do
  scroll_down
  if $wait.until{$driver.find_element(:xpath,"//*[text()='Daily rate: ']/span[contains(text(),'#{$percent}.00%')]").displayed?}
  else
    log "Entered percent is not shown"
  end
end

When(/^LL deletes all the available Pricing adjustments$/) do
  delete_icon="//*[@xmlns='http://www.w3.org/2000/svg' and @width='20']"
  until $wait.until{$driver.find_element(:xpath,delete_icon).displayed?} == false do
    el = $driver.find_element(:xpath,delete_icon)
    $driver.action.move_to(el).perform
    el.click
    sleep 1
  end
rescue Selenium::WebDriver::Error::TimeoutError
  log "All the pricing adjustments were deleted"
end

When(/^Hirer navigate to space with adjusted price$/) do
  sleep 3
  $driver.get('https://lola-protected:LoLa_Access_4_Devsonly@app-staging.locationlive.co.uk/location/test-purpose/space/test-purpose-1')
end

Then(/^Hirer select the dates with adjusted price$/) do
  sleep 1
    begin
      $driver.find_elements(:xpath,"//div[text()='#{$start_day}']").first.click
      $driver.find_elements(:xpath,"//div[text()='#{$end_day}']").first.click
    rescue
    end
  if
  $wait.until{$driver.find_element(:xpath,"//span[text()='£#{$new_price}.00']").displayed?}
  else
    puts "Adjusted price is wrong"
  end
  end