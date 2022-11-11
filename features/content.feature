
Feature: checking content moderation of content type

  Background: creation of content for article content type
    Given I am on homepage
    And I click "Log in"
    And I fill in "Username" with "viswateji"
    And I fill in "Password" with "Test@2707"
    And I press "Log in"
  @api
  Scenario: click on my account
    And I click on "Umami" icon
    And wait for 2 secs
    And I follow "My account"
    And wait for 2 secs
  @api @CreateContent
  Scenario: create content for basic page with content moderation as draft
    #And I follow "Manage"
    And wait for 2 secs
    And I follow "Content"
    Then I click on "Add content" button with "'a.button--action'"
    When I click "Basic page"
    And wait for 3 secs
    When I fill basic page details
      | Title | Body | 
    | test basic page temp 1 | test temp for content moderation|
    And wait for 3 secs

   #Then click on "Save"
   # And wait for 2 secs

  @api  @CmPublished
  Scenario: change content moderation to published
    And wait for 2 secs
    And I follow "Content"
    Then I click "test basic page"
      #tesatkjndclksd
    And wait for 2 secs
    When Make sure dropdown selected as "Published"
    And wait for 2 secs
    Then enter log message as "CM of draft -> published"
    And wait for 2 secs
    #Then I click "Apply"
    #And wait for 2 secs

  @api  @CmArchived
  Scenario: change content moderation to Archived
    And I follow "Content"
    Then I click "test basic page"
    When select dropdown value as "Archived" and set log message
    And wait for 3 secs
    #Then click on "Save"
    And wait for 2 secs

    @api @CmDraft
    Scenario: change content moderation to Draft
      And I follow "Content"
      Then I click "test basic page"
      Then click on "edit" button in FE
      #And I select "Draft" from "edit-moderation-state-0-state"
      When select dropdown value as "Draft" and set log message
      And wait for 3 secs
      Then click on "Save"
      And wait for 2 secs

  @api  @CmPublishedEdit
  Scenario: change content moderation to Archived
    And I follow "Content"
    Then I click "test basic page"
    When select dropdown value as "Published" and set log message
    And wait for 3 secs
    #Then click on "Save"
    And wait for 2 secs


