require 'selenium-webdriver'
require 'byebug'
require 'pry'
require 'date'
require 'webdrivers'

#Start chromedriver and open the web method
def start
  #$driver=Selenium::WebDriver::Chrome::Service.driver_path="./Drivers/chromedriver"
  $driver = Selenium::WebDriver.for :chrome
  $driver.get('https://lola-protected:LoLa_Access_4_Devsonly@app-staging.locationlive.co.uk/')
  #$driver.switch_to.window($driver.window_handles[1])
  $driver.manage.window.maximize
  $wait = Selenium::WebDriver::Wait.new(timeout:10)
  $wait.until{$driver.find_element(:id,"sign-in-popover").displayed? }
end

def staff
$staff_campaign_url=$driver.get('https://lola-protected:LoLa_Access_4_Devsonly@app-staging.locationlive.co.uk/planner/241')
end

#Credentials for Staging
# Hirer Manager
$email_hirer="maksym.iv@coaxsoft.com"
$pass_hirer="Test1234!"
# Hirer Staff
$email_hirer_staff="maksym.iv+4@coaxsoft.com"
$pass_hirer_staff="Test1234!"
# LL Admin
$email_landlord="landlordstaging@locationlive.co.uk"
$pass_landlord= "l0l1v320"
# LL Staff
$email_landlord_staff="maksym.iv+8@coaxsoft.com"
$pass_landlord_staff= "Test1234!"

# Image with .png extension
def image_png
directory = File.expand_path File.dirname(__FILE__)
specific_filename = directory + "/" + "Media/shop.png"
end

# Image with .jpg extension
def image_jpg
  directory = File.expand_path File.dirname(__FILE__)
  specific_filename = directory + "/" + "Media/1.jpg"
end

# Image with .pdf extension
def image_pdf
  directory = File.expand_path File.dirname(__FILE__)
  specific_filename = directory + "/" + "Media/file1.pdf"
end

#Email random generator
def email_address
  (0..8).map{('a'..'z').to_a[rand(26)]}.join+"@testing.com"
  #return email
end
#Search location
def search_location
  search_location = "//*[@id='root']/div[1]/div/div/div/main/div/div[2]/div/div/div[3]/input"
  $wait.until{$driver.find_element(:xpath,search_location).displayed?}
  $driver.find_element(:xpath,search_location).click
  $driver.find_element(:xpath,search_location).clear
  $driver.find_element(:xpath,search_location).send_keys($name_location)
  sleep 1
end
#name random generator
def random_name
  $name_location=(0..5).map{('a'..'z').to_a[rand(26)]}.join
  return $name_location
end

#scroll the page down
def scroll_down
  $driver.execute_script("window.scrollTo(0, document.body.scrollHeight)")
end

#scroll the page up
def scroll_up
  $driver.execute_script("window.scrollTo(0, -document.body.scrollHeight)")
end

#Login Hirer Manager
def authorization_hirer
  $wait.until{$driver.find_element(:id,"sign-in-popover").displayed?}
  $driver.find_element(:id,"sign-in-popover").click
  $driver.find_element(:name,"email").send_keys($email_hirer)
  $driver.find_element(:name,"password").send_keys($pass_hirer)
  $driver.find_element(:xpath,"//button[text()='Login']").click
end
#Login Hirer Staff
def authorization_hirer_staff
  $wait.until{$driver.find_element(:id,"sign-in-popover").displayed?}
  $driver.find_element(:id,"sign-in-popover").click
  $driver.find_element(:name,"email").send_keys($email_hirer_staff)
  $driver.find_element(:name,"password").send_keys($pass_hirer_staff)
  sleep 1
  $driver.find_element(:xpath,"//button[text()='Login']").click
end
#Login LandLord Admin
def authorization_landlord
  $wait.until{$driver.find_element(:id,"sign-in-popover").displayed?}
  $driver.find_element(:id,"sign-in-popover").click
  $driver.find_element(:name,"email").send_keys($email_landlord)
  $driver.find_element(:name,"password").send_keys($pass_landlord)
  $driver.find_element(:xpath,"//button[text()='Login']").click
end
#Login LL Staff
def authorization_landlord_staff
  $wait.until{$driver.find_element(:id,"sign-in-popover").displayed?}
  $driver.find_element(:id,"sign-in-popover").click
  $driver.find_element(:name,"email").send_keys($email_landlord_staff)
  $driver.find_element(:name,"password").send_keys($pass_landlord_staff)
  $driver.find_element(:xpath,"//button[text()='Login']").click
end

# def calendar
#   all_disabled_days = $driver.find_elements(:class,"DayPicker-Day--disabled")
#   all_disabled_days << $driver.find_element(:class,"DayPicker-Day--today")
#   all_days = $driver.find_elements(:class,"DayPicker-Day")
#   active_days=[]
#   all_days.each { |day| active_days << day unless all_disabled_days.include?(day) }
#   active_days.first.click
#   active_days.last.click
# end

def calendar
  begin
    $driver.find_element(:xpath,"//*[@class='DayPicker-Day' and @aria-disabled='false' and @tabindex='-1']")
    available_days=$driver.find_elements(:xpath,"//*[@class='DayPicker-Day' and @aria-disabled='false' and @tabindex='-1']")
    available_days.first.click
    available_days.first.click
  rescue
    $driver.find_element(:xpath,"//*[@class='DayPicker-NavBar']/div/button[2]").click
    sleep 2
    available_days2=$driver.find_elements(:xpath,"//*[@class='DayPicker-Day' and @aria-disabled='false' and @tabindex='-1']")
    available_days2.first.click
    available_days2.first.click
  end
end

def day_picker
  begin
    $driver.find_element(:xpath,"//*[@class='DayPicker-Day' and @aria-disabled='false' and @tabindex='-1']")
    available_days=$driver.find_elements(:xpath,"//*[@class='DayPicker-Day' and @aria-disabled='false' and @tabindex='-1']")
    available_days.first.click
    available_days.first.click
  rescue
    $driver.find_element(:xpath,"//*[@class='DayPicker-NavBar']/div/button[2]").click
    sleep 2
    available_days2=$driver.find_elements(:xpath,"//*[@class='DayPicker-Day' and @aria-disabled='false' and @tabindex='-1']")
    available_days2.first.click
    available_days2.first.click
  end
end



