Feature: Colours pixel

  Scenario: Colours given bitmap pixel
    Given I run `rubit` interactively
    When I type "I 5 6"
    And I type "L 2 3 A"
    And I type "S"
    And I type "X"
    Then the output should contain:
      """
      00000
      00000
      0A000
      00000
      00000
      00000
      """
