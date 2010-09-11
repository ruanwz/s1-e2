require "spec_helper"

describe IssueStatusesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/issue_statuses" }.should route_to(:controller => "issue_statuses", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/issue_statuses/new" }.should route_to(:controller => "issue_statuses", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/issue_statuses/1" }.should route_to(:controller => "issue_statuses", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/issue_statuses/1/edit" }.should route_to(:controller => "issue_statuses", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/issue_statuses" }.should route_to(:controller => "issue_statuses", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/issue_statuses/1" }.should route_to(:controller => "issue_statuses", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/issue_statuses/1" }.should route_to(:controller => "issue_statuses", :action => "destroy", :id => "1")
    end

  end
end
