Feature: Fill

  Scenario: Fill bitmap pixels
    Given I run `rubit` interactively
    Then I type "I 5 6"
    And I type "V 2 3 4 W"
    And I type "F 3 3 J"
    And I type "S"
    And I type "X"
    Then the output should contain:
      """
      JJJJJ
      JJJJJ
      JWJJJ
      JWJJJ
      JJJJJ
      JJJJJ
      """
