Given(/^I am signed in$/) do
  visit (unauthenticated_root_path)
  fill_in('Login', with: 'amatute')
  fill_in('Password', with: '123456')
  click_on('Iniciar sesión')
end

Given(/^I am on the home page$/) do
  visit '/'
end

When(/^I navigate to the sabbatical year link$/) do
  visit '/procedures'
end

Then(/^I should see "([^"]*)"$/) do |text|
  page.has_content? text
end

Given(/^Im in the sabbatical year page$/) do
  visit '/procedures'
end

When(/^I make a request$/) do
  click_link('Solicitar Trámite')
 
end

Then(/^I should see the requirements$/) do
  page.has_content? "Requisitos"
end

Given(/^that the user has all the initial requirements$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^the user create the request$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^a succefully created message is display$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^can watch the status of the request$/) do
  pending # Write code here that turns the phrase above into concrete actions
end



