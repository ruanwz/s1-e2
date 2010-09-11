require 'spec_helper'

describe "issues/index.html.erb" do
  before(:each) do
    assign(:issues, [
      stub_model(Issue,
        :repository_id => "",
        :user_id => "",
        :status_id => "",
        :content => ""
      ),
      stub_model(Issue,
        :repository_id => "",
        :user_id => "",
        :status_id => "",
        :content => ""
      )
    ])
  end

  it "renders a list of issues" do
    render
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
  end
end
