@te
Feature: LL adjust the price for space for some dates
#  Background:
#    Given LL navigates to Test Purpose location
  @authorized_landlord @wip0
  Scenario: LL deletes all Pricing adjustments
    Given LL navigates to Test Purpose location
    When LL deletes all the available Pricing adjustments

  @authorized_landlord
  Scenario: LL select a space for price adjustment and choose dates
    Given LL navigates to Test Purpose location
    When LL clicks 'Select space' drop-down
    Then LL select "Test Purpose 1" space
    When LL clicks "Start date" field
    Then LL select any date
    When LL clicks "End date" field
    Then LL select any date
    And LL checks if blocks for rate appears

  @authorized_landlord @wip1
  Scenario: LL edit the Day rate
    Given LL navigates to Test Purpose location
    When LL clicks 'Select space' drop-down
    Then LL select "Test Purpose 1" space
    When LL clicks "Start date" field
    Then LL select any date
    When LL clicks "End date" field
    Then LL select any date
    And LL checks if blocks for rate appears
    When LL enters "10" to Percentage field of Day rate
    Then LL clicks "Apply" button
    And LL checks if price was adjusted

  @authorized_hirer @wip
    Scenario: Hirer make option/booking with adjusted price
      When Hirer navigate to space with adjusted price
      When User clicks "Get this space" button
      Then Page scrolls to the beginning of space calendar
      Then Hirer select the dates with adjusted price
      Then User clicks the "Option" button
      Then Page which contain "Option this space" text is opened
      When User enter text to "Campaign name" field
      Then User click What drop-down
      And What drop-down list open and user select a value "Sampling"
      Then User click Sector drop-down
      And Sector drop-down list opens and user select a value "Automotive"
      Then User enters text to "Enter brand name here" field
      Then User enters text to "Type here" field
      Then User clicks the "Option" button
      And User see the text "Option submitted!"