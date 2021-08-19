Before('@start') do
  start
end

Before('@authorized_hirer_staff') do
  start
  authorization_hirer_staff
end

Before('@authorized_landlord_staff') do
  start
  authorization_landlord_staff
end

Before('@authorized_landlord') do
  start
  authorization_landlord
end

Before('@authorized_hirer') do
  start
  authorization_hirer
end

After do
  $driver.quit
end
