require 'spec_helper'

describe "repositories/edit.html.erb" do
  before(:each) do
    @repository = assign(:repository, stub_model(Repository,
      :new_record? => false,
      :name => "",
      :user_id => "",
      :type_id => "",
      :fork_by => ""
    ))
  end

  it "renders the edit repository form" do
    render

    rendered.should have_selector("form", :action => repository_path(@repository), :method => "post") do |form|
      form.should have_selector("input#repository_name", :name => "repository[name]")
      form.should have_selector("input#repository_user_id", :name => "repository[user_id]")
      form.should have_selector("input#repository_type_id", :name => "repository[type_id]")
      form.should have_selector("input#repository_fork_by", :name => "repository[fork_by]")
    end
  end
end
