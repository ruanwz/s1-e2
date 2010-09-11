require 'spec_helper'

describe "watchings/edit.html.erb" do
  before(:each) do
    @watching = assign(:watching, stub_model(Watching,
      :new_record? => false,
      :repository_id => "",
      :user_id => ""
    ))
  end

  it "renders the edit watching form" do
    render

    rendered.should have_selector("form", :action => watching_path(@watching), :method => "post") do |form|
      form.should have_selector("input#watching_repository_id", :name => "watching[repository_id]")
      form.should have_selector("input#watching_user_id", :name => "watching[user_id]")
    end
  end
end
