require 'spec_helper'

describe "watchings/index.html.erb" do
  before(:each) do
    assign(:watchings, [
      stub_model(Watching,
        :repository_id => "",
        :user_id => ""
      ),
      stub_model(Watching,
        :repository_id => "",
        :user_id => ""
      )
    ])
  end

  it "renders a list of watchings" do
    render
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
  end
end
