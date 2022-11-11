
Feature: checking content moderation of content type
  Background:

    Given I am on homepage
    Given I am logged in as a user with the administrator role
  @api
  Scenario: click on umami site logo
    Then I click on "Umami" icon
    And wait for 3 secs
  @api
  Scenario: checking content moderation using Article content type by logging in as admin
    And wait for 3 secs
    Then I follow "Content"
    And wait for 2 secs
    And "page" content:
    | title   | body     |
    | TestBasicPage | testContent |
    And wait for 3 secs

