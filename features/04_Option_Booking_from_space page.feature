@authorized_hirer
Feature: Hirer is able to make Option, booking on space page
  Background:
    Given Space Change space of 1704 Test location is opened
    When User clicks "Get this space" button
    Then Page scrolls to the beginning of space calendar
    When User select available days in the calendar

  Scenario: User is able to make an Option straight from space detailed page
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

  Scenario: User is able to make an Booking straight from space detailed page
    Then User clicks the "Book" button
    Then Page which contain "Booking form" text is opened
    When User enter text to "Campaign name" field
    Then User click What drop-down
    And What drop-down list open and user select a value "Sampling"
    Then User click Sector drop-down
    And Sector drop-down list opens and user select a value "Automotive"
    Then User enters text to "Enter brand name here" field
    Then User enters text to "Type here" field
    Then User mark the 'I agreed to the Specifics of Hire and the Booking terms' checkbox
    Then User clicks the "Submit" button
    And User see the text "Your booking is " submitted

