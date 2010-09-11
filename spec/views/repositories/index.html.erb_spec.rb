require 'spec_helper'

describe "repositories/index.html.erb" do
  before(:each) do
    assign(:repositories, [
      stub_model(Repository,
        :name => "",
        :user_id => "",
        :type => "",
        :fork_by => ""
      ),
      stub_model(Repository,
        :name => "",
        :user_id => "",
        :type => "",
        :fork_by => ""
      )
    ])
  end

  it "renders a list of repositories" do
    render
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
  end
end
