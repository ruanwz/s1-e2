require 'spec_helper'

describe "comments/new.html.erb" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :new_record? => true,
      :content => "",
      :issue_id => "",
      :user_id => ""
    ))
  end

  it "renders new comment form" do
    render

    rendered.should have_selector("form", :action => comments_path, :method => "post") do |form|
      form.should have_selector("input#comment_content", :name => "comment[content]")
      form.should have_selector("input#comment_issue_id", :name => "comment[issue_id]")
      form.should have_selector("input#comment_user_id", :name => "comment[user_id]")
    end
  end
end
