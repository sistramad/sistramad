Feature: Request a sabbatical year procedure
  In order to get a sabbatical year
  As a user
  I want to request the sabbatical year procedure so I can enjoy it

  Scenario: View the sabbatical year request page
  Given I am signed in
  And I am on the home page
  When I navigate to the sabbatical year link
  Then I should see "Solicitud Año Sabatico:"

  Scenario: Make the sabbatical year request
  Given Im in the sabbatical year page
  When I make a request
  Then I should see the requirements

  Scenario: Succefully create a sabbatical year request
  Given that the user has all the initial requirements
  When  the user create the request
  Then a succefully created message is display
  And can watch the status of the request

  
  



  