require 'spec_helper'

describe "pull_commits/index.html.erb" do
  before(:each) do
    assign(:pull_commits, [
      stub_model(PullCommit,
        :pull_request_id => "",
        :start_commit_id => "",
        :end_commit_id => "",
        :user_id => ""
      ),
      stub_model(PullCommit,
        :pull_request_id => "",
        :start_commit_id => "",
        :end_commit_id => "",
        :user_id => ""
      )
    ])
  end

  it "renders a list of pull_commits" do
    render
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
  end
end
