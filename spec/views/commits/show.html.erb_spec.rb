require 'spec_helper'

describe "commits/show.html.erb" do
  before(:each) do
    @commit = assign(:commit, stub_model(Commit,
      :message => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("".to_s)
  end
end
