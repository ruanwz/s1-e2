require 'spec_helper'

describe "repositories/show.html.erb" do
  before(:each) do
    @repository = assign(:repository, stub_model(Repository,
      :name => "",
      :user_id => "",
      :type => "",
      :fork_by => ""
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
