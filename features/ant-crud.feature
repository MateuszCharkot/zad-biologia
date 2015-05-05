Feature: I would like to edit ant

  Scenario Outline: Insert records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "loremipsum"
    And I press "Login"
    And I go to "/admin/ant/"
    Then I should not see "<ant>"
    And I follow "Create a new entry"
    Then I should see "ant creation"
    When I fill in "Name" with "<ant>"
    And I fill in "Weight" with "<ant>"
    And I press "Create"
    Then I should see "<ant>"
    And I should see "<size>"

  Examples:
    |Ant            |size     |
    |Argentine Ant  |3        |
    |Army Ant       |3        |
    |Black Ant      |4        |



  Scenario Outline: Edit records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "loremipsum"
    And I press "Login"
    And I go to "/admin/ant/"
    Then I should not see "<new-ant>"
    When I follow "<old-ant>"
    Then I should see "<old-ant>"
    When I follow "Edit"
    And I fill in "Name" with "<new-ant>"
    And I fill in "Weight" with "<new-size>"
    And I press "Update"
    And I follow "Back to the list"
    Then I should see "<new-ant>"
    And I should see "<new-size>"
    And I should not see "<old-ant>"

  Examples:
    |old-ant       |new-ant        |new-size    |
    |Argentine Ant |Bull Ant       |40          |
    |Army Ant      |Big Headed Ant |4           |


  Scenario Outline: Delete records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "loremipsum"
    And I press "Login"
    And I go to "/admin/ant/"
    Then I should see "<ant>"
    When I follow "<ant>"
    Then I should see "<ant>"
    When I press "Delete"
    Then I should not see "<ant>"

  Examples:
    |Ant            |
    |Argentine Ant  |
    |Army Ant       |
    |Bull Ant       |

