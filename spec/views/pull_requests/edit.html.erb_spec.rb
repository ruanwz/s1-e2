require 'spec_helper'

describe "pull_requests/edit.html.erb" do
  before(:each) do
    @pull_request = assign(:pull_request, stub_model(PullRequest,
      :new_record? => false,
      :content => "",
      :source_repository_id => "",
      :target_repository_id => "",
      :user_id => ""
    ))
  end

  it "renders the edit pull_request form" do
    render

    rendered.should have_selector("form", :action => pull_request_path(@pull_request), :method => "post") do |form|
      form.should have_selector("input#pull_request_content", :name => "pull_request[content]")
      form.should have_selector("input#pull_request_source_repository_id", :name => "pull_request[source_repository_id]")
      form.should have_selector("input#pull_request_target_repository_id", :name => "pull_request[target_repository_id]")
      form.should have_selector("input#pull_request_user_id", :name => "pull_request[user_id]")
    end
  end
end