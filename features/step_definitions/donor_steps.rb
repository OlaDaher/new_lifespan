When(/^I go to the home page$/) do
  visit root_path
end

Then(/^I should not see "(.*?)"$/) do |content|
  page.should_not have_content(content)
end

Given(/^I am in the home page$/) do
  visit root_path
end

When(/^I follow the "(.*?)" link$/) do |link|
  click_link(link)
end

Then(/^I should  see "(.*?)" in the "(.*?)"$/) do |arg1, arg2|
  page.should have_selector(arg2, :text => arg1)
end

Given(/^I am in a new donor page$/) do
  visit new_donor_path
end

When(/^I enter "(.*?)" in the firstname field$/) do |firstname|
  fill_in 'donor_first_name', :with => firstname
end

When(/^I enter "(.*?)" in the lastname field$/) do |lastname|
  fill_in 'donor_last_name', :with => lastname
end

When(/^I enter "(.*?)" in the phone field$/) do |phone|
  fill_in 'donor_phone', :with => phone
end

When(/^I select "(.*?)" from regions list$/) do |region|
  select region
end

When(/^I select "(.*?)" from blood type list$/) do |bloodtype|
  select bloodtype
end

When(/^I select "(.*?)" from social network list$/) do |socialnetwork|
  select socialnetwork
end

When(/^I enter "(.*?)" in the email field$/) do |email|
  fill_in 'donor_email', :with => email
end

When(/^I enter "(.*?)" in the password field$/) do |pass|
  fill_in 'donor_password', :with => pass
end

When(/^I enter "(.*?)" in the password confirmation field$/) do |pass_con|
  fill_in 'donor_password_confirmation', :with => pass_con
end

When(/^I check the active box$/) do
  check 'donor_active'
end

When(/^I click the "(.*?)" button$/) do |submitdonor|
  click_button submitdonor
end

Then(/^I see "(.*?)"$/) do |welcome|
  page.should have_content(welcome)
end

Given(/^I am in a new medic page$/) do
  visit new_medic_path
end

When(/^I enter "(.*?)" in the medic firstname field$/) do |firstname|
  fill_in 'medic_first_name', :with => firstname
end

When(/^I enter "(.*?)" in the medic lastname field$/) do |lastname|
  fill_in 'medic_last_name', :with => lastname
end

When(/^I select "(.*?)" in the organization_id list$/) do |org|
  select org
end

When(/^I select "(.*?)" from position list$/) do |position|
  select position
end

When(/^I enter "(.*?)" in the medic email field$/) do |email|
  fill_in 'medic_email', :with => email
end

When(/^I enter "(.*?)" in the medic password field$/) do |pass|
  fill_in 'medic_password', :with => pass
end

When(/^I enter "(.*?)" in the medic password confirmation field$/) do |pass|
  fill_in 'medic_password_confirmation', :with => pass
end

When(/^I check the staff box$/) do
  check 'medic_staff'
end
