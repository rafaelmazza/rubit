Feature: Vertical draw

  Scenario: Draw a vertical segment on a bitmap
    Given I run `rubit` interactively
    Then I type "I 5 6"
    And I type "V 2 3 4 W"
    And I type "S"
    And I type "X"
    Then the output should contain:
      """
      00000
      00000
      0W000
      0W000
      00000
      00000
      """
