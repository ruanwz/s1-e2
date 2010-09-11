require 'spec_helper'

describe "comments/index.html.erb" do
  before(:each) do
    assign(:comments, [
      stub_model(Comment,
        :content => "",
        :issue_id => "",
        :user_id => ""
      ),
      stub_model(Comment,
        :content => "",
        :issue_id => "",
        :user_id => ""
      )
    ])
  end

  it "renders a list of comments" do
    render
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
  end
end
