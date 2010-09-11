require 'spec_helper'

describe "followings/new.html.erb" do
  before(:each) do
    assign(:following, stub_model(Following,
      :new_record? => true,
      :user_id => "",
      :follower => ""
    ))
  end

  it "renders new following form" do
    render

    rendered.should have_selector("form", :action => followings_path, :method => "post") do |form|
      form.should have_selector("input#following_user_id", :name => "following[user_id]")
      form.should have_selector("input#following_follower", :name => "following[follower]")
    end
  end
end
