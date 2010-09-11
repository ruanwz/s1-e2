require 'spec_helper'

describe "commits/new.html.erb" do
  before(:each) do
    assign(:commit, stub_model(Commit,
      :new_record? => true,
      :message => ""
    ))
  end

  it "renders new commit form" do
    render

    rendered.should have_selector("form", :action => commits_path, :method => "post") do |form|
      form.should have_selector("input#commit_message", :name => "commit[message]")
    end
  end
end
