require 'spec_helper'

describe "pull_commits/show.html.erb" do
  before(:each) do
    @pull_commit = assign(:pull_commit, stub_model(PullCommit,
      :pull_request_id => "",
      :start_commit_id => "",
      :end_commit_id => "",
      :user_id => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("".to_s)
    rendered.should contain("".to_s)
    rendered.should contain("".to_s)
    rendered.should contain("".to_s)
  end
end
