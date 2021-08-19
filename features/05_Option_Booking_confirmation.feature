
Feature: User can validate or decline the Option/Booking

  @authorized_landlord
  Scenario: LL validate the booking request
    Given LL lands on the Booking page of 1704 Test location
    When User click the "Manage" button
    Then User click the "Validate" button
    And Confirm the validation by clicking "Yes" button in the modal window
    Then Booking transfers to the Active tab

  @authorized_landlord @test
  Scenario: LL validate the option request
    Given LL lands on the Option page of 1704 Test location
    When User click the "Manage" button
    Then User click the "Validate" button
    And Confirm the validation by clicking "Yes" button in the modal window
    Then Option transfers to the Active tab