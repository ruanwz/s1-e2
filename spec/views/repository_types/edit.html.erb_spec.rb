require 'spec_helper'

describe "repository_types/edit.html.erb" do
  before(:each) do
    @repository_type = assign(:repository_type, stub_model(RepositoryType,
      :new_record? => false,
      :name => "MyString"
    ))
  end

  it "renders the edit repository_type form" do
    render

    rendered.should have_selector("form", :action => repository_type_path(@repository_type), :method => "post") do |form|
      form.should have_selector("input#repository_type_name", :name => "repository_type[name]")
    end
  end
end
