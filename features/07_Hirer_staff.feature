
Feature: Hirer Staff can access only allowed features for him
  Background:
    When Hirer clicks on account username
    Then Hirer clicks "Account"
    Then Hirer clicks "settings"
    And  Manager clicks edit button near the Staff

  @authorized_hirer
  Scenario: Hirer Manager check if Staff has no Access for Booking history
    When Manager unmark "Can access bookings history" checkbox
    Then Manager save the changes
    And Manager logs out
    When Staff logs in
    When Hirer clicks on account username
    Then Hirer clicks "All campaigns"
    Then Staff check that "bookings" menu is not present in the left menu
    When Staff opens the any campaign
    Then Staff check that "bookings" menu is not present under opened campaign

  @authorized_hirer
  Scenario: Hirer Manager check if Staff has no Access for making bookings
    When Manager unmark "Can manage a booking" checkbox
    Then Manager save the changes
    And Manager logs out
    When Staff logs in
    When Hirer clicks on account username
    Then Hirer clicks "All campaigns"
    When Staff opens the campaign planner with added space
    When User click "Select dates" or "Add another activity" button
    Then The calendar page is opened
    Then User select available days in the calendar
    And User click "Add activity" button
    And User clicks the "Save" button
    When Staff checks that "Book" button shouldn't be display for the activity