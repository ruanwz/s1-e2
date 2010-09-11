require 'spec_helper'

describe "pull_requests/show.html.erb" do
  before(:each) do
    @pull_request = assign(:pull_request, stub_model(PullRequest,
      :content => "",
      :source_repository_id => "",
      :target_repository_id => "",
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
