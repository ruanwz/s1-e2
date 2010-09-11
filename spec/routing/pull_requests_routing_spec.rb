require "spec_helper"

describe PullRequestsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/pull_requests" }.should route_to(:controller => "pull_requests", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/pull_requests/new" }.should route_to(:controller => "pull_requests", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/pull_requests/1" }.should route_to(:controller => "pull_requests", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/pull_requests/1/edit" }.should route_to(:controller => "pull_requests", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/pull_requests" }.should route_to(:controller => "pull_requests", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/pull_requests/1" }.should route_to(:controller => "pull_requests", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/pull_requests/1" }.should route_to(:controller => "pull_requests", :action => "destroy", :id => "1")
    end

  end
end
