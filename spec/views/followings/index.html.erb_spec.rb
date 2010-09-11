require 'spec_helper'

describe "followings/index.html.erb" do
  before(:each) do
    assign(:followings, [
      stub_model(Following,
        :user_id => "",
        :follower => ""
      ),
      stub_model(Following,
        :user_id => "",
        :follower => ""
      )
    ])
  end

  it "renders a list of followings" do
    render
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
  end
end
