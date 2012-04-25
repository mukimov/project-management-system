Given /^I am not authenticated$/ do
  visit '/'
  click_link 'Sign out'
end

When /^I go to (.+)$/ do |page_name|
  visit path_to page_name
end

Given /^a user exists with email: "([^"]*)", password: "([^"]*)"$/ do |email, password|
  FactoryGirl.create(:user, email: email, password: password)
end

Given /^I am signed in|I sign in$/ do
  step %(I try to sign in)
  find_link("#{@me.email}")
end

Given /^I try to sign in$/ do
  password = "abcdef2"
  @me ||= FactoryGirl.create(:user, password: password)
  steps %Q{
    When I go to the new user session page
    And I fill in "user_email" with "#{@me.email}"
    And I fill in "user_password" with "#{password}"
    And I press "Sign in"
  }
end

Given /^I already update profile$/ do
  steps %Q{
    When I go to my edit profile page
    And I fill in "Username" with "Shukhrat Mukimov"
    When I press "Update Profile"
    Then I should see "Profile was successfully updated."
  }
end
