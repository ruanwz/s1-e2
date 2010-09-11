require 'spec_helper'

describe "issue_statuses/index.html.erb" do
  before(:each) do
    assign(:issue_statuses, [
      stub_model(IssueStatus,
        :name => ""
      ),
      stub_model(IssueStatus,
        :name => ""
      )
    ])
  end

  it "renders a list of issue_statuses" do
    render
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
  end
end
