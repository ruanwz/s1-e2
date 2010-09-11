require 'spec_helper'

describe "commit_notes/new.html.erb" do
  before(:each) do
    assign(:commit_note, stub_model(CommitNote,
      :new_record? => true,
      :note => ""
    ))
  end

  it "renders new commit_note form" do
    render

    rendered.should have_selector("form", :action => commit_notes_path, :method => "post") do |form|
      form.should have_selector("input#commit_note_note", :name => "commit_note[note]")
    end
  end
end
