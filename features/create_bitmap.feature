Feature: Create bitmap

  Scenario: Create a new bitmap
    Given I run `rubit` interactively
    When I type "I 3 3"
    And I type "S"
    And I type "X"
    Then the output should contain:
      """
      000
      000
      000
      """
