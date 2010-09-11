require 'spec_helper'

describe "commits/index.html.erb" do
  before(:each) do
    assign(:commits, [
      stub_model(Commit,
        :message => ""
      ),
      stub_model(Commit,
        :message => ""
      )
    ])
  end

  it "renders a list of commits" do
    render
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
  end
end
