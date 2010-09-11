require 'spec_helper'

describe "issue_statuses/show.html.erb" do
  before(:each) do
    @issue_status = assign(:issue_status, stub_model(IssueStatus,
      :name => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("".to_s)
  end
end
