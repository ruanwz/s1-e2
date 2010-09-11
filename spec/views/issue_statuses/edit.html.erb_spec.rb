require 'spec_helper'

describe "issue_statuses/edit.html.erb" do
  before(:each) do
    @issue_status = assign(:issue_status, stub_model(IssueStatus,
      :new_record? => false,
      :name => ""
    ))
  end

  it "renders the edit issue_status form" do
    render

    rendered.should have_selector("form", :action => issue_status_path(@issue_status), :method => "post") do |form|
      form.should have_selector("input#issue_status_name", :name => "issue_status[name]")
    end
  end
end
