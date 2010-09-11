require 'spec_helper'

describe "repository_types/show.html.erb" do
  before(:each) do
    @repository_type = assign(:repository_type, stub_model(RepositoryType,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
  end
end
