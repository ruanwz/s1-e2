require 'spec_helper'

describe "pull_requests/index.html.erb" do
  before(:each) do
    assign(:pull_requests, [
      stub_model(PullRequest,
        :content => "",
        :source_repository_id => "",
        :target_repository_id => "",
        :user_id => ""
      ),
      stub_model(PullRequest,
        :content => "",
        :source_repository_id => "",
        :target_repository_id => "",
        :user_id => ""
      )
    ])
  end

  it "renders a list of pull_requests" do
    render
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
  end
end
