require 'spec_helper'

describe "comments/show.html.erb" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :content => "",
      :issue_id => "",
      :user_id => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("".to_s)
    rendered.should contain("".to_s)
    rendered.should contain("".to_s)
  end
end
