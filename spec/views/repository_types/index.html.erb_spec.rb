require 'spec_helper'

describe "repository_types/index.html.erb" do
  before(:each) do
    assign(:repository_types, [
      stub_model(RepositoryType,
        :name => "Name"
      ),
      stub_model(RepositoryType,
        :name => "Name"
      )
    ])
  end

  it "renders a list of repository_types" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
  end
end
