Feature: Terminate session

  Scenario: Terminate current session
    Given I run `rubit` interactively
    When I type "X"
    Then the output should contain "Bye!"

