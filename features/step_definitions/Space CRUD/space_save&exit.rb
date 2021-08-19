
Then('User clicks Save&Exit button') do
  $wait.until{$driver.find_element(:id,"save-and-exit-popover").displayed? }
  $driver.find_element(:id,"save-and-exit-popover").click
end
