@skryabin_com
Feature: Smoke steps

  Background:
    Given I open url "https://skryabin.com/market/quote.html"
    Then I should see page title as "Get a Quote"
    Then element with xpath "//input[@name='email']" should be present

  @skryabin_com_email_1
  Rule: Predefined steps for skryabin.com - email

  Background:
    When I type "maus" into element with xpath "//input[@name='username']"
    When I type "GsomGsom!1" into element with xpath "//input[@name='password']"
    When I type "GsomGsom!1" into element with xpath "//input[@id='confirmPassword']"

    When I type "Marcus Aurelius" into element with xpath "//input[@name='name']"

    Then I click on element with xpath "//input[@name='agreedToPrivacyPolicy']"

  Scenario Outline: Valid - email
    When I type <email> into element with xpath "//input[@name='email']"
      #Then I click on element using JavaScript with xpath "(//button[@type='submit'])[1]"
    Then I click on element with xpath "//button[@type='submit']"

    Then I wait for element with xpath "//legend[@class='applicationResult']" to be present
    Then element with xpath "//legend[@class='applicationResult']" should contain text "Submitted Application"
    Then element with xpath "//*[@name='email']" should contain text <email>

    Examples:
      | email        |
      | "maus@bb.cc" |
      | "maus@bb"    |

  Scenario Outline: Invalid - email
    When I type <email> into element with xpath "//input[@name='email']"
      #Then I click on element using JavaScript with xpath "(//button[@type='submit'])[1]"
    Then I click on element with xpath "//button[@type='submit']"

    Then I wait for 1 sec
    Then element with xpath "//legend[@class='applicationResult']" should not be visible

    Examples:
      | email        |
      | "maus.bb.cc" |
      | "maus"       |
      | "@bb.cc"     |

  @skryabin_com_username_1
  Rule: Predefined steps for skryabin.com - username

  Scenario: All - username
    When I type "cc" into element with xpath "//input[@name='username']"
    Then I click on element with xpath "//body"
    Then element with xpath "//label[@id='username-error']" should not be visible
    When I clear element with xpath "//input[@name='username']"
    When I type "c" into element with xpath "//input[@name='username']"
    Then I click on element with xpath "//body"
    Then element with xpath "//label[@id='username-error']" should be visible
    Then element with xpath "//label[@id='username-error']" should contain text "enter at least"
    When I clear element with xpath "//input[@name='username']"
    Then I click on element with xpath "//body"
    Then element with xpath "//label[@id='username-error']" should be visible
    Then element with xpath "//label[@id='username-error']" should contain text "This field is required"
    When I type "cc" into element with xpath "//input[@name='username']"
    Then I click on element with xpath "//body"
    Then element with xpath "//label[@id='username-error']" should not be visible

  @skryabin_com_password_1
  Rule: Predefined steps for skryabin.com - password #1

  Scenario: All - password #1
    When I type "ccccc" into element with xpath "//input[@name='password']"
    Then I click on element with xpath "//body"
    Then element with xpath "//label[@id='password-error']" should not be visible
    When I clear element with xpath "//input[@name='password']"
    When I type "c" into element with xpath "//input[@name='password']"
    Then I click on element with xpath "//body"
    Then element with xpath "//label[@id='password-error']" should be visible
    Then element with xpath "//label[@id='password-error']" should contain text "enter at least"
    When I clear element with xpath "//input[@name='password']"
    Then I click on element with xpath "//body"
    Then element with xpath "//label[@id='password-error']" should be visible
    Then element with xpath "//label[@id='password-error']" should contain text "This field is required"
    When I type "ccccc" into element with xpath "//input[@name='password']"
    Then I click on element with xpath "//body"
    Then element with xpath "//label[@id='password-error']" should not be visible

  @skryabin_com_password_2
  Rule: Predefined steps for skryabin.com - password #2

  Scenario: All - password #2
    When I type "ccccc" into element with xpath "//input[@name='password']"

    When I type "ccccc" into element with xpath "//input[@name='confirmPassword']"
    Then I click on element with xpath "//body"
    Then element with xpath "//label[@id='confirmPassword-error']" should not be visible
    When I clear element with xpath "//input[@name='confirmPassword']"
    When I type "c" into element with xpath "//input[@name='confirmPassword']"
    Then I click on element with xpath "//input[@name='password']"
    #Then I wait for element with xpath "//label[@id='confirmPassword-error']" to be present
    Then element with xpath "//label[@id='confirmPassword-error']" should be visible
    Then element with xpath "//label[@id='confirmPassword-error']" should contain text "enter at least"
    When I clear element with xpath "//input[@name='confirmPassword']"
    Then I click on element with xpath "//body"
    Then element with xpath "//label[@id='confirmPassword-error']" should be visible
    Then element with xpath "//label[@id='confirmPassword-error']" should contain text "This field is required"
    When I type "cccccc" into element with xpath "//input[@name='confirmPassword']"
    Then I click on element with xpath "//body"
    Then element with xpath "//label[@id='confirmPassword-error']" should be visible
    Then element with xpath "//label[@id='confirmPassword-error']" should contain text "not match"
    When I clear element with xpath "//input[@name='confirmPassword']"
    When I type "ccccc" into element with xpath "//input[@name='confirmPassword']"
    Then I click on element with xpath "//body"
    Then element with xpath "//label[@id='confirmPassword-error']" should not be visible

  @skryabin_com_name
  Rule: Predefined steps for skryabin.com - name

  Scenario: All - name
    Given I fill out first name "Fig" and last name "Two"
    Then I wait for 1 sec
