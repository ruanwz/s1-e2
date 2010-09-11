require 'spec_helper'

describe "commit_notes/show.html.erb" do
  before(:each) do
    @commit_note = assign(:commit_note, stub_model(CommitNote,
      :note => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("".to_s)
  end
end
