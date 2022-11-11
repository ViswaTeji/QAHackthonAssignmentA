@ArticleListing
Feature: checking content moderation of content type

  Background: creation of content for article content type
    Given I am on homepage
    And I click "Log in"
    And I fill in "Username" with "viswateji"
    And I fill in "Password" with "Test@2707"
    And I press "Log in"

  @api @CreateArticleContent
  Scenario: create article and view it in article listing page
    #And I follow "Manage"
    And wait for 2 secs
    And I follow "Content"
    Then I click on "Add content" button
    When I click "Article"
    And wait for 3 secs
    When I fill basic page details
      | Title | Body | Tags | URL alias|Saveas |
      | Article create | test article creation | Alcohol Free, Cake |/articles/article-create| Published|
    And wait for 3 secs
    Then click on "Save"
    And wait for 2 secs
    And I wait for page to load
    Then I should see the heading "Article create"
    When I click "Articles" in the "header" region
    And I wait for page to load
    #Then I click on "Article create" button with xpath "//article[@about='/en/articles/article-create']]"
    Then I click on "Article create" button with xpath "//div[@class='view-content']/div[1]/article[1]"
    When I follow "View Article"
    And I wait for page to load
    Then I should see the heading "Article create"
    
    @es @api @ArticleListingSpanish
    Scenario: create article and view it in article listing page for spanish site
    #And I follow "Manage"
      And wait for 2 secs
      Then click on "Español"
      And wait for 2 secs
      And I follow "Contenido"
      And wait for 2 secs
      Then I click on "Añadir contenido" button
      And wait for 2 secs
      When I click "Article"
      And wait for 3 secs
      When I fill basic page details
        | Title | Body | Tags | URL alias|Saveas |
        |nueva Artículo crear | tcreación de artículo de prueba |Pastel, Sin Alcohol |/artículos/nueva-artículo-crear| Published|
      And wait for 3 secs
      Then click on "Guardar"
      And wait for 2 secs
      And I wait for page to load
      Then I should see the heading "nueva Artículo crear"
      When I click "Articles" in the "header" region
      And I wait for page to load
    #Then I click on "Article create" button with xpath "//article[@about='/en/articles/article-create']]"
      Then I click on "nueva Artículo crear" button with xpath "//div[@class='view-content']/div[1]/article[1]"
      When I follow "Ver Article"
      And I wait for page to load
      Then I should see the heading "nueva Artículo crear"



  

