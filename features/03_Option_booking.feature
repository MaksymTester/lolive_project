@authorized_hirer
Feature: User able to add activity in the Campaign planner, make an Option/Booking
  Background:
    Given User log in as Hirer and navigate to Campaign planner id '203' (Location: '1704' Test, Space: Space change was added)
    When User check if the activity was added, he deletes it
    When User click "Select dates" or "Add another activity" button
    Then The calendar page is opened
    Then User select available days in the calendar
    And User click "Add activity" button
    And User clicks the "Save" button

  Scenario: User is able to add activity and delete
    When User clicks the "Delete" button
    Then Click "Yes" button in the confirmation pop-up

  Scenario: User is able to make an Option
    When User clicks the "Option" button
    Then Page which contain "Option this space" text is opened
    Then User clicks the "Option" button
    And User see the text "Option submitted!"


  Scenario: User is able to make a Booking
    When User clicks the "Book" button
    Then Page which contain "Booking form" text is opened
    Then User mark the 'I agreed to the Specifics of Hire and the Booking terms' checkbox
    Then User clicks the "Submit" button
    And User see the text "Your booking is " submitted

