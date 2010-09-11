require 'spec_helper'

describe "commits/edit.html.erb" do
  before(:each) do
    @commit = assign(:commit, stub_model(Commit,
      :new_record? => false,
      :message => ""
    ))
  end

  it "renders the edit commit form" do
    render

    rendered.should have_selector("form", :action => commit_path(@commit), :method => "post") do |form|
      form.should have_selector("input#commit_message", :name => "commit[message]")
    end
  end
end
