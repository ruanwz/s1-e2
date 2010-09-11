require 'spec_helper'

describe "watchings/new.html.erb" do
  before(:each) do
    assign(:watching, stub_model(Watching,
      :new_record? => true,
      :repository_id => "",
      :user_id => ""
    ))
  end

  it "renders new watching form" do
    render

    rendered.should have_selector("form", :action => watchings_path, :method => "post") do |form|
      form.should have_selector("input#watching_repository_id", :name => "watching[repository_id]")
      form.should have_selector("input#watching_user_id", :name => "watching[user_id]")
    end
  end
end
