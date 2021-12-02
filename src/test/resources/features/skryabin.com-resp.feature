@skryabin_com_resp
Feature: Responsive design

  Background:
    Given I open url "https://skryabin.com/market/quote.html"
    Then I should see page title as "Get a Quote"

  @medium_size
  Scenario Outline: Medium size
    When I resize window to <width> and <height>
    Then element with xpath "//input[@name='username']" should be in viewport
    Then element with xpath "//input[@name='email']" should be in viewport
    Then element with xpath "//input[@name='password']" should be in viewport
    Then element with xpath "//input[@name='confirmPassword']" should be in viewport
    Then element with xpath "//input[@name='name']" should be in viewport
    Then element with xpath "//input[@name='phone']" should be in viewport
    Then element with xpath "//input[@name='dateOfBirth']" should be in viewport
    Then element with xpath "//select[@name='countryOfOrigin']" should be in viewport
    Then element with xpath "//input[@name='gender'][@value='male']" should be in viewport
    Then element with xpath "//input[@name='gender'][@value='female']" should be in viewport
    Then element with xpath "//input[@name='allowedToContact']" should be in viewport
    Examples:
      | width | height |
      | 1024  | 1000   |
      | 1000  | 1000   |
      | 800   | 1024   |
      | 600   | 800    |
      | 480   | 640    |
