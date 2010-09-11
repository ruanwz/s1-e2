require 'spec_helper'

describe "repositories/new.html.erb" do
  before(:each) do
    assign(:repository, stub_model(Repository,
      :new_record? => true,
      :name => "",
      :user_id => "",
      :type => "",
      :fork_by => ""
    ))
  end

  it "renders new repository form" do
    render

    rendered.should have_selector("form", :action => repositories_path, :method => "post") do |form|
      form.should have_selector("input#repository_name", :name => "repository[name]")
      form.should have_selector("input#repository_user_id", :name => "repository[user_id]")
      form.should have_selector("input#repository_type", :name => "repository[type]")
      form.should have_selector("input#repository_fork_by", :name => "repository[fork_by]")
    end
  end
end
