Epic: As a user, I can view twitter stats for an twitter user

Scenario: As a visitor to the website
  When I am on the hompage
  Then I will be prompted to enter a username

  Given I have entered a username
  Then the page will introduce the stats for the user
