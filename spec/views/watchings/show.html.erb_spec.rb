require 'spec_helper'

describe "watchings/show.html.erb" do
  before(:each) do
    @watching = assign(:watching, stub_model(Watching,
      :repository_id => "",
      :user_id => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("".to_s)
    rendered.should contain("".to_s)
  end
end
