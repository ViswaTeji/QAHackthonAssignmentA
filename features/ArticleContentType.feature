@ArticleContentType
Feature: checking Article content type

  Background: Logging in with Admin creds
    Given I am on homepage
    And I click "Log in"
    And I fill in "Username" with "viswateji"
    And I fill in "Password" with "Test@2707"
    And I press "Log in"

  @api @CreateArticleContent
  Scenario: create Article content type
    #And I follow "Manage"
    And wait for 2 secs
    And I follow "Content"
    Then I click on "Add content" button
    When I click "Article"
    And wait for 3 secs
    When I fill basic page details
      | Title | Body | Tags |
      | Test Article | test temp for content moderation| Alcohol Free,Cake |
    Then I should see the heading "Create Article"
    And I should see "Title"
    And I should see "Body"
    And I should see "Language"
    And I should see "Tags"
    And I should see "Media Image"
    And wait for 3 secs
   Then click on "Save"
    And wait for 2 secs
    And I wait for page to load
    Then I should see the heading "Test Article"


    @api @EditArticle
    Scenario: edit article node
      And I follow "Content"
      Then I should see "Test Article"
      #Then I click "Test Article"
      And wait for 3 secs
      Then I click on "Edit" button with xpath "//a[@href='/en/node/26/edit?destination=/en/admin/content']"
      And wait for 3 secs
      Then I click on "x" button with xpath "//input[@value='Remove']"
      And wait for 2 secs
      Then I click on "Add media" button with xpath "//input[@value='Add media']"
      And wait for 2 secs
      #To add file from system
      #And I attach the file "/Users/viswatejivundavalli/Downloads/scenary.png" to "Add file"
      #And wait for 3 secs
      #And I fill in "Alternative text" with "Test image"
      #And I wait for page to load
      #And wait for 3 secs
      #And I click on the element with xpath "//button[contains(text(),'Save')]"
      #And I wait for page to load
      And I check the box "scenary.png"
      And wait for 3 secs
      And I click on the element with xpath "//button[contains(text(),'Insert selected')]"
      And I wait for page to load
      And wait for 3 secs
      Then click on "Save"
      And wait for 2 secs
      Then I should see the following success messages:
      |Success messages|
      |Status message|
      |Article Test Article has been updated|
      And wait for 2 secs

      @api @RevertRevisions
      Scenario: Revert revisions of article node
        And I follow "Content"
        Then I should see "Test Article"
      #Then I click "Test Article"
        And wait for 3 secs
        Then I click on "Edit" button with xpath "//a[@href='/en/node/26/edit?destination=/en/admin/content']"
        And wait for 3 secs
        Then I click on "Revisions" button with xpath "//a[@href='/en/node/26/revisions']"
        And wait for 2 secs
        Then I click on "Revert" button with xpath "//a[@href='/en/node/26/revisions/67/revert']"
        And wait for 2 secs
        Then I click on "Revert" button with xpath "//input[@value='Revert']"
        And wait for 2 secs
        Then I should see the following success messages:
       |Success messages|
       |Status message|
       |Article Test Article has been reverted to the revision from Thu, 11/10/2022 - 13:12.|
        And wait for 2 secs