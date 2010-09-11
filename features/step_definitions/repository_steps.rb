Given /^the following repositories:$/ do |repositories|
  Repository.create!(repositories.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) repository$/ do |pos|
  visit repositories_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following repositories:$/ do |expected_repositories_table|
  expected_repositories_table.diff!(tableish('table tr', 'td,th'))
end
