
Feature: Landlord can add the Option/Booking/Calendar note via the Master calendar
  Background:
    Given LL lands on the calendar page of 1704 Test location
    When LL clicks "Create new activity" button
    Then Choose date FROM in the calendar picker
    And Choose date TO in the calendar picker

  @authorized_landlord
  Scenario: LL create an Option
    Then LL mark the 'Option' checkbox
    Then LL click What drop-down
    And What drop-down list open and user select a value "Sampling"
    Then Mark any available Space for selected dates
    And LL scroll down and clicks "Create activity" button
    When LL open option menu and go to Active tab
    Then Check if Option with selected dates display

  @authorized_landlord
  Scenario: LL create an Booking
    Then LL mark the 'Booking' checkbox
    Then LL click What drop-down
    And What drop-down list open and user select a value "Sampling"
    Then Mark any available Space for selected dates
    And LL scroll down and clicks "Create activity" button
    When LL open bookings menu and go to Active tab
    Then Check if Booking with selected dates display

  @authorized_landlord
  Scenario: LL create a Calendar note
    Then LL mark the 'Just a calendar note' checkbox
    Then LL enter "Automation test" text to Add note field
    Then Mark any available Space for selected dates
    And LL scroll down and clicks "Create activity" button
    Then Calendar page is opened