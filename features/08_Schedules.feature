@authorized_hirer

Feature: Hirer can create schedule list in the campaign planner and edit/update/add spaces and activity
  Background:
    Given Hirer open campaign planner (id 266) with added space


  Scenario: Hirer create a schedule list with space only
    When Hirer clicks the 'Create schedule' button
    Then 'Select the spaces you want to add to your schedule' modal is opened
    When Hirer select the checkbox near space
    Then Hirer clicks 'Add' button
    Then Hirer lands on the Schedule list
    And Hirer check if selected space was added

  Scenario: Schedule's name can be changed
    When Hirer opens any Schedule list
    Then Hirer clicks "Edit schedule name"
    When Hirer clear the previous schedule name
    Then Hirer enter new schedule name
    And Hirer clicks "Save schedule name"
    Then Hirer check if schedule name was changed


  Scenario: Hirer clicks 'Add spaces to schedule' button
    When Hirer clicks the 'Create schedule' button
    Then 'Select the spaces you want to add to your schedule' modal is opened
    When Hirer select the checkbox near space
    Then Hirer clicks 'Add' button
    Then Hirer lands on the Schedule list
    When Hirer clicks "Add spaces to schedule"
    Then 'Select the spaces you want to add to your schedule' modal is opened

  Scenario: Hirer create a schedule list with space + activity
    When User click "Select dates" or "Add another activity" button
    Then The calendar page is opened
    Then User select available days in the calendar
    And User click "Add activity" button
    And User clicks the "Save" button
    When Hirer clicks the 'Create schedule' button
    Then 'Select the spaces you want to add to your schedule' modal is opened
    When Hirer select the checkbox near space
    And Hirer mark the activity
    Then Hirer clicks 'Add' button
    Then Hirer lands on the Schedule list
    And Hirer check if selected space was added


  Scenario: Hirer add activity via the 'Have a schedule ready?' block
    When User check if the activity was added, he deletes it
    When User click "Select dates" or "Add another activity" button
    Then The calendar page is opened
    Then User select available days in the calendar
    And User click "Add activity" button
    When Hirer click the "Have a schedule ready?" drop-down
    Then Hirer select any schedule from the list
    And User clicks the "Save" button
    Then Hirer switch to selected Schedule
    And Hirer check if selected space was added

  Scenario: Schedule's can be deleted
    When Hirer deletes all the schedules