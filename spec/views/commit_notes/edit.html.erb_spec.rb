require 'spec_helper'

describe "commit_notes/edit.html.erb" do
  before(:each) do
    @commit_note = assign(:commit_note, stub_model(CommitNote,
      :new_record? => false,
      :note => ""
    ))
  end

  it "renders the edit commit_note form" do
    render

    rendered.should have_selector("form", :action => commit_note_path(@commit_note), :method => "post") do |form|
      form.should have_selector("input#commit_note_note", :name => "commit_note[note]")
    end
  end
end
