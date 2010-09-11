require 'spec_helper'

describe "repository_types/new.html.erb" do
  before(:each) do
    assign(:repository_type, stub_model(RepositoryType,
      :new_record? => true,
      :name => "MyString"
    ))
  end

  it "renders new repository_type form" do
    render

    rendered.should have_selector("form", :action => repository_types_path, :method => "post") do |form|
      form.should have_selector("input#repository_type_name", :name => "repository_type[name]")
    end
  end
end
