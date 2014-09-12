Feature: Horizontal draw

  Scenario: Draw a horizontal segment on a bitmap
    Given I run `rubit` interactively
    And I type "I 5 6"
    And I type "H 3 4 2 Z"
    And I type "S"
    And I type "X"
    Then the output should contain:
      """
      00000
      00ZZ0
      00000
      00000
      00000
      00000
      """
