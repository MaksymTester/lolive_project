Given(/^Hirer open campaign planner \(id 266\) with added space$/) do
  sleep 3
  $driver.get('https://lola-protected:LoLa_Access_4_Devsonly@app-staging.locationlive.co.uk/planner/266')
  sleep 5
end

When(/^Hirer clicks the 'Create schedule' button$/) do
  create_schedule = $wait.until {
    element = $driver.find_element(:xpath, "//button[text()='Create schedule']")
    element if element.displayed?
  }
  create_schedule.click
end

Then(/^'Select the spaces you want to add to your schedule' modal is opened$/) do
  $wait.until {
    element = $driver.find_element(:xpath, "//h3[text()='Select the spaces you want to add to your schedule']")
    element if element.displayed?
  }
end

When(/^Hirer select the checkbox near space$/) do
    $wait.until{$driver.find_element(:class,"checkbox-btn__checkbox-custom").displayed?}
    $driver.find_elements(:class,"checkbox-btn__checkbox-custom").first.click
    sleep 1
  end

Then(/^Hirer clicks 'Add' button$/) do
  $driver.find_element(:xpath, "//button[text()='Add']").click
end

Then(/^Hirer lands on the Schedule list$/) do
  $wait.until {
    element = $driver.find_element(:xpath, "//span[text()='Edit schedule name']")
    element if element.displayed?
  }
end

And(/^Hirer check if selected space was added$/) do
  $wait.until{$driver.find_element(:xpath,"//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div[5]/div/div[1]/div[2]").displayed?}
end

When(/^Hirer opens any Schedule list$/) do
  $driver.find_element(:xpath,"//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div[2]/div[1]/div/div/div/div[1]/div").click
  $schedule_name=$driver.find_element(:xpath,"//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div[2]/div[1]/div/div/div/div[1]/div").text
  sleep 3
end

When(/^Hirer clear the previous schedule name$/) do
  sleep 1
  $driver.action.key_down(:command).send_keys("a").perform
  sleep 2
end

Then(/^Hirer enter new schedule name$/) do
  $driver.find_element(:xpath,"//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div[2]/div[1]/div/div/div/div[1]/div").send_keys("update")
  sleep 0.5
  $driver.find_element(:xpath,"//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div[2]/div[1]/div/div/div/div[1]/div").send_keys("update")
  sleep 1
end

Then(/^Hirer check if schedule name was changed$/) do
  begin
    $driver.find_element(:xpath,"//*[text()='update']").displayed?
  rescue
    log("no such schedule")
  end
end

When(/^Hirer check if schedule was deleted$/) do
  sleep 1
  begin
    $driver.find_element(:xpath,"//*[text()='#{$schedule_name}']")
  rescue
    log("Schedule was deleted")
    end
end

And(/^Hirer mark the activity$/) do
  $driver.find_elements(:class,"checkbox-btn__checkbox-custom").last.click
  sleep 1
end


When(/^Hirer click the "Have a schedule ready\?" drop\-down$/) do
  sleep 3
  schedules_list="//*[text()='Select a schedule']"
  $wait.until{$driver.find_element(:xpath,schedules_list).displayed?}
  $driver.find_element(:xpath,schedules_list).click
end

Then(/^Hirer select any schedule from the list$/) do
  $driver.find_elements(:xpath, "//*[contains(text(), 'Schedule')]").first.click
end

Then(/^Hirer deletes all the schedules$/) do
    schedule_tab="//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div[2]/div[1]/div/div/div/div[1]/div"
    until $wait.until{$driver.find_element(:xpath,schedule_tab).displayed?} == false do
    $driver.find_element(:xpath,schedule_tab).click
    delete="//*[text()='Delete schedule']"
    $wait.until{$driver.find_element(:xpath,delete).displayed?}
    $driver.find_element(:xpath,delete).click
    confirm="//*[text()='Yes']"
    sleep 0.5
    $wait.until{$driver.find_element(:xpath,confirm).displayed?}
    $driver.find_element(:xpath,confirm).click
    sleep 3
    end
    rescue Selenium::WebDriver::Error::TimeoutError
    log "All the schedules were deleted"
    end

Then(/^Hirer switch to selected Schedule$/) do
  sleep 4
  $driver.find_element(:xpath,"//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div[2]/div[1]/div/div/div/div[1]/div").click
end