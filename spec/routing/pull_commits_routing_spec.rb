require "spec_helper"

describe PullCommitsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/pull_commits" }.should route_to(:controller => "pull_commits", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/pull_commits/new" }.should route_to(:controller => "pull_commits", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/pull_commits/1" }.should route_to(:controller => "pull_commits", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/pull_commits/1/edit" }.should route_to(:controller => "pull_commits", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/pull_commits" }.should route_to(:controller => "pull_commits", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/pull_commits/1" }.should route_to(:controller => "pull_commits", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/pull_commits/1" }.should route_to(:controller => "pull_commits", :action => "destroy", :id => "1")
    end

  end
end
