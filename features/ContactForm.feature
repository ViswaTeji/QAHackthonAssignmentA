#language: en
@ContactFormEn
Feature: validation of contact form

  @Scenario1:
    Scenario: To check contact page
     Given I am on homepage
     And I click English
     Given I should see the link Contact
     Then I click Contact
    #Given I am in the "/" path
     Then I should see the heading "Website feedback"
     When I enter following details
      | Your name     | Your email address        | Subject      | Message  |
      | viswa teji    | v.viswateji+01@gmail.com  | Test subject | test msg |
    #And wait for 2 secs
    #Then I press the "Send message" button

 # @temp
#  Scenario Outline: Verify contact form
  #  And I fill in "Your name" with "<Your name>"
  #  And I fill in "Your email address" with "<Your email address>"
  #  And I fill in "Subject" with "<Subject>"
  #  And I fill in "Message" with "<Message>"
  #  And I press "Send message"
  #  Then I should see the heading "<Result>"

 #   Examples:
 #     | Your name | Your email address        | Subject           | Message | Result                                                               |
 #     | viswa     | v.viswateji+03@gmail.com  | MY ACCOUNT details| test    | The website encountered an unexpected error. Please try again later. |
  #    | teji      | v.viswateji+02@gmail.com  | AUTHENTICATION |     temp   |                                                       |




