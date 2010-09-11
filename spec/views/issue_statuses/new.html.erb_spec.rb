require 'spec_helper'

describe "issue_statuses/new.html.erb" do
  before(:each) do
    assign(:issue_status, stub_model(IssueStatus,
      :new_record? => true,
      :name => ""
    ))
  end

  it "renders new issue_status form" do
    render

    rendered.should have_selector("form", :action => issue_statuses_path, :method => "post") do |form|
      form.should have_selector("input#issue_status_name", :name => "issue_status[name]")
    end
  end
end
