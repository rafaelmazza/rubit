Feature: Clear bitmap 

  Scenario: Clear given bitmap 
    Given I run `rubit` interactively
    When I type "I 3 3"
    And I type "L 1 1 A"
    And I type "C"
    And I type "S"
    And I type "X"
    Then the output should contain:
      """
      000
      000
      000
      """
