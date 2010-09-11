require 'spec_helper'

describe "comments/edit.html.erb" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :new_record? => false,
      :content => "",
      :issue_id => "",
      :user_id => ""
    ))
  end

  it "renders the edit comment form" do
    render

    rendered.should have_selector("form", :action => comment_path(@comment), :method => "post") do |form|
      form.should have_selector("input#comment_content", :name => "comment[content]")
      form.should have_selector("input#comment_issue_id", :name => "comment[issue_id]")
      form.should have_selector("input#comment_user_id", :name => "comment[user_id]")
    end
  end
end
