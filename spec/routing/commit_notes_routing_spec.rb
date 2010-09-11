require "spec_helper"

describe CommitNotesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/commit_notes" }.should route_to(:controller => "commit_notes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/commit_notes/new" }.should route_to(:controller => "commit_notes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/commit_notes/1" }.should route_to(:controller => "commit_notes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/commit_notes/1/edit" }.should route_to(:controller => "commit_notes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/commit_notes" }.should route_to(:controller => "commit_notes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/commit_notes/1" }.should route_to(:controller => "commit_notes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/commit_notes/1" }.should route_to(:controller => "commit_notes", :action => "destroy", :id => "1")
    end

  end
end
