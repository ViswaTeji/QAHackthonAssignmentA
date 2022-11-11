
Feature: checking content moderation of content type

  Background: creation of content for article content type
    Given I am on homepage
    And I click "Log in"
    And I fill in "Username" with "viswateji"
    And I fill in "Password" with "Test@2707"
    And I press "Log in"
    
    @api @RecipeTerm
    Scenario: Taxonomy term creation
      Then I follow "Structure"
      And wait for 3 secs
      Then I follow "Taxonomy"
      And wait for 2 secs
      Then I click on "List terms" button with xpath "//a[@href='/en/admin/structure/taxonomy/manage/recipe_category/overview']"
      And wait for 3 secs
      Then I click on "Add term" button with "'a.button--action'"
      And wait for 2 secs
      Then fill the following details
        | Name | Description | Language | Weight| URL alias |
        | Drinks | Drinks available| English |0|/recipe-category/drinks |
      And wait for 2 secs
      #Then click on "Save and go to list"
      #And wait for 2 secs
   @api @RecipeContent
     Scenario: Recipe content type creation
     And I follow "Content"
     Then I click on "Add content" button with "'a.button--action'"
     When I click "Recipe"
     And wait for 3 secs
     Then I should see the heading "Create Recipe"
     When I fill in "Recipe Name" with "Oats with milk"
     And I fill in "Preparation time" with "20"
     Then I fill in "Cooking time" with "10"
     Then I fill in "Number of servings" with "4"
     And I select "Easy" from "Difficulty"
     Then  I check the box "Main courses"
     And wait for 3 secs
     Then select "Tags" from dropdown value as "Breakfast"
     And I wait for AJAX to finish
     And wait for 3 secs
     And I press the "Add media" button
     #To add file from system
     #And I attach the file "/Users/viswatejivundavalli/Downloads/oatsmilk.jpeg" to "Add file"
     #And wait for 3 secs
     #And I fill in "Alternative text" with "Test image"
     #And I wait for page to load
     #And wait for 3 secs
     #And I click on the element with xpath "//button[contains(text(),'Save')]"
     #And I wait for page to load
     #And wait for 3 secs
     And I check the box "oatsmilk.jpeg"
     And wait for 3 secs
     And I click on the element with xpath "//button[contains(text(),'Insert selected')]"
     And I wait for page to load
     And wait for 3 secs
     And I fill in wysiwyg on field "edit-field-summary-0-value" with "low calorie and high protein breakfast"
     And wait for 3 secs
     And I fill in "Ingredients (value 1)" with "Oats"
     And I press the "Add another item" button
     And I wait for AJAX to finish
     And I fill in "Ingredients (value 2)" with "Milk"
     And I press the "Add another item" button
     And I wait for AJAX to finish
     And I fill in "Ingredients (value 3)" with "Honey"
     And wait for 3 secs
     And I fill in wysiwyg on field "edit-field-recipe-instruction-0-value" with "Please follow below steps: Boil a glass of Milk by mixing a 1\4th glass of water in it, and then take it into a bowl and mix a spoon of honey along with req amount of oats"
     And I select "Published" from "Save as"
    # Then I press the "Save" button
   #  And I save the node url
    # Then I should see the heading "Oats with milk"
    # And I should see the link "Main courses"
    # And I should see the link "Breakfast"
   #Then click on "Save"
     And wait for 2 secs

  @api @RecipeContentUsingTable
  Scenario: Recipe content type creation
    And I follow "Content"
    Then I click on "Add content" button with "'a.button--action'"
    When I click "Recipe"
    And wait for 3 secs
    When I fill recipe details
      |Recipe Name|Language| Preparation time| Number of servings| Difficulty | Tags                  |Option|  Summary                               |Ingredients1 |  Ingredients2| Ingredients3| Recipe instruction                                                                                                                               |Save as|URL alias|
      |Oats with milk| English  |10               |4                  | Easy       |Alcohol Free, Breakfast| oatsmilk.jpeg | low calorie and high protein breakfast | Oats| Milk|honey| Boil a glass of Milk by mixing a 1\4th glass of water in it, and then take it into a bowl and mix a spoon of honey along with req amount of oats | Published |/recipe/oats|
   Then I press the "Save" button
    Then print current URL
    Then I should see the heading "Oats with milk"
    And wait for 3 secs
    And I should see the link "Main courses"
    And wait for 2 secs
    And I should see the link "Breakfast"
    And wait for 3 secs
    And wait for 2 secs

  @en @ErrorMessages
  Scenario: Verify error message is displayed on adding blank/spaces on Recipes content
    And I follow "Content"
    Then I click on "Add content" button with "'a.button--action'"
    When I click "Recipe"
    And wait for 3 secs
    Then I should see the heading "Create Recipe"
    When I fill in "Recipe Name" with "Oats with milk"
    And I fill in "Preparation time" with "20"
    Then I fill in "Cooking time" with "10"
    Then I fill in "Number of servings" with "4"
    And I select "Easy" from "Difficulty"
    Then  I check the box "Main courses"
    And wait for 3 secs
    Then select "Tags" from dropdown value as "Breakfast"
    And I wait for AJAX to finish
    And wait for 3 secs
    And I fill in wysiwyg on field "edit-field-summary-0-value" with "low calorie and high protein breakfast"
    And wait for 3 secs
    And I fill in "Ingredients (value 1)" with "Oats"
    And I press the "Add another item" button
    And I wait for AJAX to finish
    And I fill in "Ingredients (value 2)" with "Milk"
    And I press the "Add another item" button
    And I wait for AJAX to finish
    And I fill in "Ingredients (value 3)" with "Honey"
    And wait for 3 secs
    And I select "Published" from "Save as"
    Then I press the "Save" button
    And wait for 3 secs
    Then I should see the following error messages:
      | error messages                       |
      | Error message        |
      | Media Image field is required.|
      |Recipe instruction field is required.|
    And wait for 4 secs

