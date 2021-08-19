
Feature: Log in to the web, register new account, perform a search, create Space,location etc.
  @start
  Scenario Outline: User is able to login
    Given User opens browser,navigate to URL
    When User enter "<email>" email address
    And User enter "<pass>" password
    Then User click Sign in button
    Examples:
    |email                              |pass     |
    |maksym.iv@coaxsoft.com             |Test1234!|
    |maksym.iv+4@coaxsoft.com           |Test1234!|
    |maksym.iv+8@coaxsoft.com           |Test1234!|
    |landlordstaging@locationlive.co.uk |l0l1v320 |

  @start
  Scenario: User is able to Register new account
    Given User open browser,navigate to URL and open Registration form page
    When User enter First Name
    And User enter Last Name
    And User enter Job Title
    And User enter Business number
    And User enter Business email
    And User enter new password to Create password field
    And User enter same password to Confirm field
    And User enter Company Name
    And User select Business Type from drop down list
    Then User click Sign up button

  @authorized_landlord
  Scenario: User is able create Location
    Given User open browser,navigate to URL and log in as Landlord
    When User click Add a new location button
    Then The Location form open
    When User enter Location name
    And User select Type of your location from drop down
    And User select Country from drop down
    And User select Region from drop down
    And User select City from drop down
    And User enter Address line
    And User enter Post code
    And User enter Description
    And User select Financial year from calendar
    And User Upload logo file
    And User Upload images of your location
    And User enter Video links of your location
    And User enter Location virtual tour
    And User enter Name your floor plan
    And User Upload floor plan
    And User click Add floor plan button
    Then User click Continue button
    When User enter Weekly footfall
    And User enter ABC 1
    And User enter Average dwell time visit
    And User enter Average spend per head
    And User enter Male
    And User enter Female
    And User enter Generation Z
    And User enter Generation Y
    And User enter Generation X
    And User enter Generation BB
    Then User click Save button
    Then User click I want to add them later button
    Then User check if the Location was created

  @authorized_landlord
  Scenario: User is able create Space
    Given User open browser,navigate to URL,log in as Landlord
    When User clicks on location
    When User clicks on listing menu
    When User clicks Add a new space button
    Then New space form displays
    When User enter Space name
    And User select Type of space
    And User enter width for Space size
    And User enter length for Space size
    And User enter height for Space size
    And User select Use of space from drop-down
    And User select In proximity from drop-down
    And User enter Neighbours
    And User enter Brief description
    And User select Opening hours on Monday (From and To)
    And User select Opening hours on Tuesday (From and To)
    And Mark checkbox closed for Wednesday
    And Mark checkbox closed for Thursday
    And Mark checkbox closed for Friday
    And Mark checkbox closed for Saturday
    And Mark checkbox closed for Sunday
    And User Upload siteplan .pdf file
    And User Upload logo file of brands
    And User clicks Add button after uploading logo file
    And User select Locate your space on the floorplans from drop-down
    And User Upload images of the space
    And User Upload install pack of this space
    And User enter Virtual link
    Then User clicks Continue button
    Then Rules of the space page opens
    When User selects Do weekend bookings include friday? option
    And User enters Please state the Terms and Conditions of this space field
    Then User clicks Continue button on the 2nd page
    Then Rate card page opens
    When User enters Daily rate
    And User enters Weekly rate
    Then User clicks Continue button on the 3rd page
    Then User clicks Go to Publish button
    Then User check if the Space was created

  @authorized_landlord
  Scenario: User is able to edit Space
    Given User open browser,navigate to URL,log in as Landlord,open Location and start edit the Space
    When User click Space name field and enter new Space name
    And User change the Type of space
    And User enter new value in width for Space size
    And User enter new in length for Space size
    And User enter new in height for Space size
    Then User clicks Save button
    Then User clicks Edit button near space
    Then User check if new data was saved in the fields

  @authorized_landlord
  Scenario: User is able create Save&Exit while Space creating
    Given User open browser,navigate to URL,log in as Landlord
    When User clicks on location
    When User clicks on listing menu
    When User clicks Add a new space button
    Then New space form displays
    When User enter Space name
    And User select Type of space
    And User enter width for Space size
    And User enter length for Space size
    And User enter height for Space size
    And User select Use of space from drop-down
    And User select In proximity from drop-down
    And User enter Neighbours
    And User enter Brief description
    And User select Opening hours on Monday (From and To)
    And User select Opening hours on Tuesday (From and To)
    And Mark checkbox closed for Wednesday
    And Mark checkbox closed for Thursday
    And Mark checkbox closed for Friday
    And Mark checkbox closed for Saturday
    And Mark checkbox closed for Sunday
    And User Upload siteplan .pdf file
    And User Upload logo file of brands
    And User clicks Add button after uploading logo file
    And User select Locate your space on the floorplans from drop-down
    And User Upload images of the space
    And User Upload install pack of this space
    And User enter Virtual link
    Then User clicks Continue button
    Then Rules of the space page opens
    Then User clicks Save&Exit button

  @authorized_landlord
  Scenario: User is able to delete the created Location
    Given User open browser,navigate to URL,log in as Landlord
    When User clicks on the Search field and enter Location name that was previously created
    Then Click delete icon and confirm
    And User try find the deleted Location in the list


