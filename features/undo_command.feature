Feature: Undo command

  Scenario: Undo last command
    Given I run `rubit` interactively
    When I type "I 3 3"
    And I type "L 1 1 A"
    And I type "C"
    And I type "U"
    And I type "S"
    And I type "X"
    Then the output should contain:
      """
      A00
      000
      000
      """
