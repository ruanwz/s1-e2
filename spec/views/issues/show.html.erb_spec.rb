require 'spec_helper'

describe "issues/show.html.erb" do
  before(:each) do
    @issue = assign(:issue, stub_model(Issue,
      :repository_id => "",
      :user_id => "",
      :status_id => "",
      :content => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("".to_s)
    rendered.should contain("".to_s)
    rendered.should contain("".to_s)
    rendered.should contain("".to_s)
  end
end
