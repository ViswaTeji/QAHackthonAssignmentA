<?php

use Drupal\DrupalExtension\Context\RawDrupalContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Behat\Tester\Exception\PendingException;
use Drupal\DrupalExtension\Context\DrupalContext;
use Behat\Mink\Exception\ElementNotFoundException;


/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawDrupalContext {

  /**
   * Initializes context.
   *
   * Every scenario gets its own context instance.
   * You can also pass arbitrary arguments to the
   * context constructor through behat.yml.
   */
  public function __construct() {
  }

    /**
     * @Given /^wait for (\d+) secs$/
     * @Dadas /^esperar (\d+) segundos$/
     */
    public function waitForSecs($arg1)
    {
        // $this->waitForSecs($arg1);
        sleep(seconds: $arg1);
    }

    /**
     * @Given /^I should see the text "([^"]*)" and fill with "([^"]*)"$/
     */
    public function iShouldSeeTheTextAndFillWith($arg1, $arg2)
    {
        $this->assertPageContainsText($arg1);

    }


    /**
     * @Given /^for "form\-text required"([^"]*)"Viswa"$/
     */
    public function forEnterValue($field,$value)
    {
       # $page = $this->getSession()->getPage();
       # $page->find('xpath', "//input[@id='$field']")->setValue($value);
        $this->fillField($field,$value);
    }

    /**
     * @When /^I enter following details$/
     * @When Ingreso los siguientes detalles
     */
    public function iEnterFollowingDetails(TableNode $table)
    {
        $page = $this->getSession()->getPage();

        foreach ($table as $row) {
            var_dump($row);

            $name = $row['Your name'];
            $email = $row['Your email address'];
            $subject = $row['Subject'];
            $message = $row['Message'];

            $page->find('css', 'input#edit-name')->setValue($name);
            $page->find('xpath', "//input[@id='edit-mail']")->setValue($email);
            $page->find('css', 'input#edit-subject-0-value')->setValue($subject);
            $page->find('css', 'textarea#edit-message-0-value')->setValue($message);
        }
    }

    /**
     * @Given I am logged in as a user with name :Username
     */
    public function iAmLoggedInAsAUserWithName($Username)
    {
        $page = $this->getSession()->getPage();
        $user = $page->find('css', 'a#toolbar-item-user')->getValue();
        if ($user=$Username) {
            echo $user;
        }
        else echo incorrectuser-$user;
    }

    /**
     * @Then /^I click on "([^"]*)" icon$/
     */
    public function iClickOnIcon($arg1)
    {
        $page = $this->getSession()->getPage();
        $page->find('css', 'a.site-logo')->click();
    }
    /**
     *  @Then I click on :arg1 button
     */
    public function iClickOnButton()
    {
        $page = $this->getSession()->getPage();
        $page->find('css', 'a.button--action')->click();
    }
    /**
     * @When /^I fill basic page details$/

     */
    public function iFillBasicPageDetails(TableNode $table)
    {
        $page = $this->getSession()->getPage();

        foreach ($table as $row) {
            var_dump($row);

            $title = $row['Title'];
            $body = $row['Body'];
            $tags =$row['Tags'];
            $saveas =$row['Saveas'];
            $urlalias = $row['URL alias'];
            $page->find('css', 'input#edit-title-0-value')->setValue($title);
            $this->getSession()->switchToIFrame(0);
            $this->getSession()->getPage()->find('css', 'body.cke_editable')->setValue($body);
            // Switch Back to Main Window
            $this->getSession()->getDriver()->switchToIFrame(null);
            $this->waitForSecs(3);
            $page->find('css', 'input#edit-field-tags-target-id')->setValue($tags);
            $this->waitForSecs(3);
            $page->find('xpath', "//summary[text()='Alias de URL']")->click();
            $page->find('css', 'input#edit-path-0-alias')->setValue($urlalias);
            $this->waitForSecs(3);
            $state = $page->find('css', 'select#edit-moderation-state-0-state')->getValue();
            if($state== $saveas){

                echo 'already in '.$saveas;
            }
            else {

                $this->waitForSecs(2);
                $page->find('css', 'select#edit-moderation-state-0-state')->selectOption($saveas);
                $updatedState=$page->find('css', 'select#edit-moderation-state-0-state')->getValue();
                echo $updatedState;
            }
            $this->waitForSecs(3);
        }
    }
    /**
     * @Then click on :arg1
     */
    public function clickOn($arg1)
    {
        $page = $this->getSession()->getPage();
        $page->find('css', 'input#edit-submit')->click();
    }

    /**
     * @When Make sure dropdown selected as :moderationstate
     */
    public function makeSureDropdownSelectedAsPublished($moderationstate)
    {
        $page = $this->getSession()->getPage();
        #$label=empty($page->find('xpath', "//label[text()='Change to']")->getValue());
        #$labelText ='Change to';
        $label = $page->find('xpath', "//label[text()='Change to']");
       try{
           if ($label->isVisible()) {
               #if ($labelText == $label)
               #{
               $state = $page->find('css', 'select.form-select')->getValue();
               if($state = $moderationstate) {
                   echo $state;
                   echo ' basic content moderation FE edit page';


               } else {
                   echo $state;
               }
               # }
               # else{
               #    echo 'label not available';
               #}



           }
        } catch (Exception $e) {
           echo "moderation changing is not available";
           $page->find('xpath', "//a[@href='/en/node/24/edit']")->click();
           $this->waitForSecs(2);
           echo 'temp';
       }



    }


    /**
     * @Then enter log message as :arg1
     */
    public function enterLogMessageAs($arg1)
    {
        $page = $this->getSession()->getPage();
        $page->find('css', 'input#edit-revision-log')->setValue($arg1);
    }

    /**
     * @When /^select dropdown value as "([^"]*)" and set log message$/
     */
    public function selectDropdownValueAsAndSetLogMessage($arg1)
    {
        $page = $this->getSession()->getPage();
        $page->find('xpath', "//a[@href='/en/node/21/edit']")->click();
        $this->waitForSecs(2);
        $state = $page->find('css', 'select#edit-moderation-state-0-state')->getValue();
        $currentState = $page->find('css', 'div#edit-moderation-state-0-current')->getText();
        echo 'before if statement '.$state. '\n';
        echo ' and current state '.substr($currentState,14). '/n';
        if(substr($currentState,14) == $arg1){

            echo 'already in '.$currentState;
        }
        else {

            $this->waitForSecs(2);
            $page->find('css', 'select#edit-moderation-state-0-state')->selectOption($arg1);
            $updatedState=$page->find('css', 'select#edit-moderation-state-0-state')->getValue();
            $logMessage = 'CM from'.$currentState.'->'. $updatedState;
            $page->find('css', 'textarea#edit-revision-log-0-value')->setValue( $logMessage);
            $this->waitForSecs(2);
            echo $updatedState;
        }
    }

    /**
     * @Then /^click on "([^"]*)" button in FE$/
     */
    public function clickOnButtonInFE($arg1)
    {
        $page = $this->getSession()->getPage();
        $page->find('xpath', "//a[@href='/en/node/21/edit']")->click();
        $this->waitForSecs(2);
    }

    /**
     * @Then /^Enter search details "([^"]*)"$/
     * @Then Ingrese los detalles de búsqueda :arg1
     */
    public function enterSearchDetails($arg1)
    {
        $page = $this->getSession()->getPage();
        $page->find('css', 'input#edit-keys')->setValue($arg1);

    }

    /**
     * @Then /^I click on "([^"]*)" button with "'([^"]*)'"$/
     * @param mixed $locator
     */
    public function iClickOnButtonWith($arg1, mixed $locator)
    {
        $page = $this->getSession()->getPage();
        $page->find('css', $locator)->click();
    }

    /**
     * @Then /^I click on "([^"]*)" button with xpath "([^"]*)"$/
     */
    public function iClickOnButtonWithEnAdminStructureTaxonomyManageRecipe_categoryOverview($arg1, $locator)
    {
        $page = $this->getSession()->getPage();
        $page->find('xpath', $locator)->click();
    }

    /**
     * @Then /^fill the following details$/
     */
    public function fillTheFollowingDetails(TableNode $table)
    {
        foreach ($table as $row) {
            var_dump($row);
            $name = $row['Name'];
            $description = $row['Description'];
            $language = $row['Language'];
            $weight = $row['Weight'];
            $urlalias = $row['URL alias'];
            $page = $this->getSession()->getPage();
            $page->find('css', 'input#edit-name-0-value')->setValue($name);
            $this->getSession()->switchToIFrame(0);
            $this->getSession()->getPage()->find('css', 'body.cke_editable')->setValue($description);
            // Switch Back to Main Window
            $this->getSession()->getDriver()->switchToIFrame(null);
            $page->find('css', 'select#edit-langcode-0-value')->selectOption($language);
            $page->find('css', 'summary.claro-details__summary')->click();
            $page->find('css', 'input#edit-weight')->setValue($weight);
            $page->find('css', 'input#edit-path-0-alias')->setValue($urlalias);
        }

        }

    /**
     * @When /^I fill recipe details$/
     * @throws Exception
     */
    public function iFillRecipeDetails(TableNode $table)
    {
        foreach ($table as $row) {
            var_dump($row);
            $recipename = $row['Recipe Name'];
            $language = $row['Language'];
            $preparationtime = $row['Preparation time'];
            $servingsno = $row['Number of servings'];
            $difficulty = $row['Difficulty'];
            $tags = $row['Tags'];
            $option = $row['Option'];
            $summary = $row['Summary'];
            $ingredients1 = $row['Ingredients1'];
            $ingredients2 = $row['Ingredients2'];
            $ingredients3 = $row['Ingredients3'];
            $recipeinstruction = $row['Recipe instruction'];
            $saveas = $row['Save as'];
            $urlalias = $row['URL alias'];
            $page = $this->getSession()->getPage();
            $page->find('css', 'input#edit-title-0-value')->setValue($recipename);
            $page->find('css', 'select#edit-langcode-0-value')->selectOption($language);
            $page->find('css', 'input#edit-field-preparation-time-0-value')->setValue($preparationtime);
            $page->find('css', 'input#edit-field-number-of-servings-0-value')->setValue($servingsno);
            $page->find('css', 'select#edit-field-difficulty')->selectOption($difficulty);
            $this->waitForSecs(3);
            $page->find('xpath', "//summary[text()='URL alias']")->click();
            $page->find('css', 'input#edit-path-0-alias')->setValue($urlalias);
            $this->waitForSecs(3);
            $page->find('css', 'input#edit-field-recipe-category-31')->click();
            $this->waitForSecs(3);
            $page->find('css', 'input#edit-field-tags-target-id')->setValue($tags);
            $this->waitForSecs(3);
            $page->find('css', '#edit-field-media-image-open-button')->click();
            $this->waitForSecs(3);
            $this->getSession()->getPage()->checkField($option);
            $page->find('xpath', "//button[contains(text(),'Insert selected')]")->click();
            $this->getSession()->switchToIFrame(0);
            $this->getSession()->getPage()->find('css', 'body.cke_editable_themed')->setValue($summary);
            // Switch Back to Main Window
            $this->getSession()->getDriver()->switchToIFrame(null);
            $this->waitForSecs(3);
            $page->find('xpath', "//input[@name='field_ingredients[0][value]']")->setValue($ingredients1);
            $this->waitForSecs(3);
            $page->find('xpath', "//input[@value='Add another item']")->click();
            $this->waitForAjaxAndAnimation();
            $this->waitForSecs(3);
            $page->find('xpath', "//input[@name='field_ingredients[1][value]']")->setValue($ingredients2);
            $this->waitForSecs(3);
            $page->find('xpath', "//input[@value='Add another item']")->click();
            $this->waitForAjaxAndAnimation();
            $this->waitForSecs(3);
            $page->find('xpath', "//input[@name='field_ingredients[2][value]']")->setValue($ingredients3);
            $this->waitForSecs(3);
            $this->getSession()->switchToIFrame(1);
            $this->getSession()->getPage()->find('css', 'body.cke_editable_themed')->setValue($recipeinstruction);
            // Switch Back to Main Window
            $this->getSession()->getDriver()->switchToIFrame(null);
            $this->waitForSecs(3);
            $state = $page->find('css', 'select#edit-moderation-state-0-state')->getValue();
            if($state== $saveas){

                echo 'already in '.$saveas;
            }
            else {

                $this->waitForSecs(2);
                $page->find('css', 'select#edit-moderation-state-0-state')->selectOption($saveas);
                $updatedState=$page->find('css', 'select#edit-moderation-state-0-state')->getValue();
                echo $updatedState;
            }
            $this->waitForSecs(3);
            #$this->scrollAndClick(cssSelector: "//summary[text()='URL alias']");
            #$page->find('xpath', "//summary[text()='URL alias']")->click();
            $this->waitForSecs(4);
            #$page->find('css', 'input#edit-path-0-alias')->setValue($urlalias);
            #$this->waitForSecs(3);
        }
    }
    /**
     * @Given /^I wait for page to load$/
     */
    public function iWaitForPageToLoad()
    {
        $this->getSession()->wait(50000, 'document.readyState == "complete"');
    }
    /**
     * Click on the element with the provided xpath query
     *
     * @When /^I click on the element with xpath "([^"]*)"$/
     */
    public function iClickOnTheElementWithXPath($xpath)
    {
        $session = $this->getSession(); // get the mink session
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', $xpath)
        ); // runs the actual query and returns the element

        // errors must not pass silently
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate XPath: "%s"', $xpath));
        }

        // ok, let's click on it
        $element->click();

    }
    /**
     * @Then /^I fill in wysiwyg on field "([^"]*)" with "([^"]*)"$/
     */
    public function iFillInWysiwygOnFieldWith($locator, $value)
    {
        $el = $this->getSession()->getPage()->findField($locator);
        $fieldId = $el->getAttribute('id');

        if (empty($fieldId)) {
            throw new Exception('Could not find an id for field with locator: ' . $locator);
        }

        $this->getSession()->executeScript("CKEDITOR.instances[\"$fieldId\"].setData(\"$value\");");
    }

    /**
     * @Then /^select "([^"]*)" from dropdown value as "([^"]*)"$/
     */
    public function selectFromDropdownValueAs($field, $prefix)
    {
        $field = str_replace('\\"', '"', $field);
        $session = $this->getSession();
        $page = $session->getPage();
        $element = $page->findField($field);

        if (!$element) {
            throw new ElementNotFoundException($session, NULL, 'named', $field);
        }

        $page->fillField($field, $prefix);
        $this->waitForSecs(2);
        $xpath = $element->getXpath();
        $driver = $session->getDriver();
        $prefix = str_replace('\\"', '"', $prefix);
        $chars = str_split($prefix);
        $last_char = array_pop($chars);

        // autocomplete.js uses key down/up events directly.
        $driver->keyDown($xpath, 8);
        $driver->keyUp($xpath, 8);
        $driver->keyDown($xpath, $last_char);
        $driver->keyUp($xpath, $last_char);

        // Wait for AJAX to finish.
        $this->waitForAjaxAndAnimation();

        // Press the down arrow to select the first option.
        $driver->keyDown($xpath, 40);
        $driver->keyUp($xpath, 40);

        // Press the Enter key to confirm selection, copying the value into the field.
        $driver->keyDown($xpath, 13);
        $driver->keyUp($xpath, 13);

        // Wait for AJAX to finish.
        $this->waitForAjaxAndAnimation();

        // Press the Tab key to remove focus.
        $driver->keyDown($xpath, 9);
        $driver->keyUp($xpath, 9);
    }

    /**
     * Wait until Ajax call and Loading DX8 animation is finished.
     *
     * @var $wait - Max wait time in seconds.
     */
    public function waitForAjaxAndAnimation($wait = 30)
    {
        $script = "(jQuery.active === 0 && jQuery(':animated').length === 0 && jQuery('.is-loading').length === 0)";
        $this->getSession()
            ->wait($wait, $script);
    }

    public function scrollAndClick($cssSelector)
    {
        $function = <<<JS
        (
            function()
            {
                document.querySelector("$cssSelector").scrollIntoView();
            }, function()
            {
                document.querySelector("$cssSelector").click();
            })() 
JS;
        try
        {
            $this->getSession()->executeScript($function);
        }
        catch (Exception $e)
        {
            throw new \Exception("Scroll Into View Failed. Check Your Script");
        }
    }

    /**
     * @Given /^Enter field "([^"]*)" with value "([^"]*)"$/
     */
    public function enterFieldWithValue($locator, $value)
    {
        $this->getSession()->getPage()->find('xpath',"$locator")->setValue($value);
    }

}


