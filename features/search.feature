#language: en
  Feature:  verification of Search and advanced search feature.

    Background: Homepage verification
      Given I am on homepage
      And wait for 2 secs
      And I click English

    @api @search
     Scenario: Enter search details
       Then Enter search details "Articles"
       And wait for 3 secs
       Then click on Search
      And wait for 3 secs
      And I should see the heading "Search for Articles"
      And wait for 3 secs
  @BasicSearch
    Scenario: Enter search details
      Then Enter search details " "
      And wait for 3 secs
      Then click on Search
      And wait for 3 secs
      And I should see the error message "Please enter some keywords."
      And wait for 3 secs

    @api @NoSearchResult
    Scenario: Incorrect search details
      Then Enter search details "lamp"
      And wait for 3 secs
      Then click on Search
      And wait for 3 secs
      And I should see the heading "Search for lamp"
      And wait for 3 secs
      And I should see the heading "Your search yielded no results."
      And wait for 3 secs

    @api @AdvancedSearchWarningmsg
    Scenario: Incorrect search details
      And I am logged in as a user with the administrator role
      Then Enter search details " "
      And wait for 3 secs
      Then click on Search
      And wait for 3 secs
      And I should see the heading "Search"
      And wait for 3 secs
      And I click on "Advanced search" button with xpath "//details[@id='edit-advanced']"
      And wait for 4 secs
      And I click on "Article" button with xpath "//input[@id='edit-type-article']"
      And wait for 4 secs
      And I click on "Advanced search" button with xpath "//input[@id='edit-submit--2']"
      And wait for 4 secs
      And I should see the warning message "You must include at least one keyword to match in the content. Keywords must be at least 3 characters, and punctuation is ignored."
      And wait for 3 secs
    @api @AdvancedSearch
    Scenario: Incorrect search details
      And I am logged in as a user with the administrator role
      Then Enter search details "baked"
      And wait for 3 secs
      Then click on Search
      And wait for 3 secs
      And I should see the heading "Search"
      And wait for 3 secs
      And I click on "Advanced search" button with xpath "//details[@id='edit-advanced']"
      And wait for 4 secs
      And I click on "Article" button with xpath "//input[@id='edit-type-recipe']"
      And wait for 4 secs
      And Enter field "//input[@id='edit-or']" with value "pork"
      And wait for 3 secs
      And I click on "Advanced search" button with xpath "//input[@id='edit-submit--2']"
      And wait for 4 secs
      And I should see the link "Borscht with pork ribs"
      And wait for 3 secs
