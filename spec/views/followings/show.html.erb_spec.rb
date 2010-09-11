require 'spec_helper'

describe "followings/show.html.erb" do
  before(:each) do
    @following = assign(:following, stub_model(Following,
      :user_id => "",
      :follower => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("".to_s)
    rendered.should contain("".to_s)
  end
end
