require 'spec_helper'

describe "followings/edit.html.erb" do
  before(:each) do
    @following = assign(:following, stub_model(Following,
      :new_record? => false,
      :user_id => "",
      :follower => ""
    ))
  end

  it "renders the edit following form" do
    render

    rendered.should have_selector("form", :action => following_path(@following), :method => "post") do |form|
      form.should have_selector("input#following_user_id", :name => "following[user_id]")
      form.should have_selector("input#following_follower", :name => "following[follower]")
    end
  end
end
