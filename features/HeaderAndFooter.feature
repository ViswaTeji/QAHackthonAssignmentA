#language: en
Feature:  verification of header and footer

  Background: Homepage verification
    Given I am on homepage
    And wait for 2 secs
    And I click English

    @Homepage
      Scenario: Homepage checks
      When I click "Find out more" in the "footer" region
      And wait for 3 secs
      Then I click on "Umami" icon
      And wait for 2 secs
      When I click "Contact" in the "footer" region
      And wait for 3 secs
      Then I click on "Umami" icon
      And wait for 2 secs
      When I click "Articles" in the "header" region
      And wait for 3 secs
      Then I click on "Umami" icon
      And wait for 2 secs
      When I click "Recipes" in the "header" region
      And wait for 3 secs

    @ContactFormPage
      Scenario: Contact form page check
      When I click "Contact" in the "footer" region
      And wait for 3 secs
      When I click "Find out more" in the "footer" region
      And wait for 3 secs
      When I click "Contact" in the "footer" region
      And wait for 3 secs
      Then I should see the heading "Umami Food Magazine"
      And wait for 3 secs
      When I click "Contact" in the "footer" region
      And wait for 3 secs
      When I click "Articles" in the "header" region
      And wait for 3 secs
      When I click "Contact" in the "footer" region
      And wait for 3 secs
      When I click "Recipes" in the "header" region
      And wait for 3 secs

  @SearchResultsPage
     Scenario: search result page check
    Then click on Search
    And wait for 3 secs
    When I click "Find out more" in the "footer" region
    And wait for 3 secs
    Then click on Search
    And wait for 3 secs
    When I click "Contact" in the "footer" region
    And wait for 3 secs
    Then click on Search
    And wait for 3 secs
    Then I should see the heading "Umami Food Magazine"
    And wait for 3 secs
    Then click on Search
    And wait for 3 secs
    When I click "Articles" in the "header" region
    And wait for 3 secs
    Then click on Search
    And wait for 3 secs
    When I click "Recipes" in the "header" region
    And wait for 3 secs