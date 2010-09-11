require 'spec_helper'

describe "pull_commits/edit.html.erb" do
  before(:each) do
    @pull_commit = assign(:pull_commit, stub_model(PullCommit,
      :new_record? => false,
      :pull_request_id => "",
      :start_commit_id => "",
      :end_commit_id => "",
      :user_id => ""
    ))
  end

  it "renders the edit pull_commit form" do
    render

    rendered.should have_selector("form", :action => pull_commit_path(@pull_commit), :method => "post") do |form|
      form.should have_selector("input#pull_commit_pull_request_id", :name => "pull_commit[pull_request_id]")
      form.should have_selector("input#pull_commit_start_commit_id", :name => "pull_commit[start_commit_id]")
      form.should have_selector("input#pull_commit_end_commit_id", :name => "pull_commit[end_commit_id]")
      form.should have_selector("input#pull_commit_user_id", :name => "pull_commit[user_id]")
    end
  end
end
