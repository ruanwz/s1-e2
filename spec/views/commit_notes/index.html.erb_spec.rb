require 'spec_helper'

describe "commit_notes/index.html.erb" do
  before(:each) do
    assign(:commit_notes, [
      stub_model(CommitNote,
        :note => ""
      ),
      stub_model(CommitNote,
        :note => ""
      )
    ])
  end

  it "renders a list of commit_notes" do
    render
    rendered.should have_selector("tr>td", :content => "".to_s, :count => 2)
  end
end
