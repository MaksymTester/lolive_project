When(/^User clicks on the Search field and enter Location name that was previously created$/) do
  search_location
end

Then(/^Click delete icon and confirm$/) do
  delete = "//div[@title='delete location']"
  $wait.until{$driver.find_element(:xpath,delete).displayed?}
  $driver.find_element(:xpath,delete).click
  modal_yes="//button[text()='Yes']"
  $wait.until{$driver.find_element(:xpath,modal_yes).displayed?}
  $driver.find_element(:xpath,modal_yes).click
  sleep 3
end

And(/^User try find the deleted Location in the list$/) do
  search_location
  begin
    $wait.until{$driver.find_element(:xpath,"//*[text()='#{$name_location}']").displayed?}
    log "Location is still displayed"
  rescue
    log "Location is not occurred"
  end
end