 @api
Feature:As an Authenticated user I
  not be able to access any admin menus

  @AuthenticatedUser
  Scenario: Verify Authenticated user  does not permissions to create
  content and admin menu
    Given I am logged in as a user with the "authenticated" role
    # Verify User does not have access to create content
    Then I should get access denied for "/en/admin/content"
    Then I should get access denied for "/en/node/add/page"
    And I should get access denied for "/en/node/add/article"
    And I should get access denied for "/en/node/add/recipe"
    # Verify User does not have access to Structure and child menus
    And I should get access denied for "/en/admin/structure"
    And I should get access denied for "/en/admin/structure/block"
    And I should get access denied for "/en/admin/structure/contact"
    And I should get access denied for "/en/admin/structure/types"
    And I should get access denied for "/en/admin/structure/display-modes"
    And I should get access denied for "/en/admin/structure/media"
    And I should get access denied for "/en/admin/structure/taxonomy"
    And I should get access denied for "/en/admin/structure/views"
    # Verify User does not have access to Appearance
    And I should get access denied for "/en/admin/appearance"
    # Verify User does not have access to Modules
    Then I should get access denied for "/en/admin/modules"
    #Verify User does not have access to Drupal Configs
    Then I should get access denied for "/en/admin/config"
    And I should get access denied for "/en/admin/config/development/performance"
    And I should get access denied for "/en/admin/config/regional/language"
    And I should get access denied for "/en/admin/config/system/site-information"
    And I should get access denied for "/en/admin/config/system/cron"
    #Verify User does not have access to creating new users and see reports
    Then I should get access denied for "/en/admin/people"
    And I should get access denied for "/en/admin/reports"
    # Verify Editor does not have access to create taxonomy terms
    Then I should get access denied for "/en/admin/structure/taxonomy/manage/recipe_category/add"
    And I should get access denied for "en/admin/structure/taxonomy/manage/tags/add"
