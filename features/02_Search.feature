@authorized_hirer
Feature: User able to start a search on the Go search page
  Background:
    When User click Go search
    Then User is redirected to search page

  Scenario: User is able to search for locations
    When User click What drop-down
    Then What drop-down list open and user select a value "Sampling"
    When User click Start field
    Then Calendar picker open and user select the Start date
    When User click End field
    Then Calendar picker open and user select the End date
    When User click Where drop-down
    Then Where drop-down list open and user select a value
    When User click on "External space" checkbox
    And User input space Width
    And User input space Length
    And User click Go search button
    Then Search is performed and location list is displayed

  Scenario: Select different options from 'What' drop-down
    When User click What drop-down
    Then What drop-down list open and user select a value "Sampling"
    Then I click 'Go Search' button
    Then User see the validation message "Oops! This field is required!"

  Scenario: User enter location name to 'Search location' field and select the location from the list
    When User enter "west" to 'Search location' field
    Then User select "Westfield London" from the suggestion list
    Then User is redirected to the 'Westfield London' location page