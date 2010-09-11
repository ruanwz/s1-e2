require 'spec_helper'

describe "issues/new.html.erb" do
  before(:each) do
    assign(:issue, stub_model(Issue,
      :new_record? => true,
      :repository_id => "",
      :user_id => "",
      :status_id => "",
      :content => ""
    ))
  end

  it "renders new issue form" do
    render

    rendered.should have_selector("form", :action => issues_path, :method => "post") do |form|
      form.should have_selector("input#issue_repository_id", :name => "issue[repository_id]")
      form.should have_selector("input#issue_user_id", :name => "issue[user_id]")
      form.should have_selector("input#issue_status_id", :name => "issue[status_id]")
      form.should have_selector("input#issue_content", :name => "issue[content]")
    end
  end
end
