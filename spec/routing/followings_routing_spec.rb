require "spec_helper"

describe FollowingsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/followings" }.should route_to(:controller => "followings", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/followings/new" }.should route_to(:controller => "followings", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/followings/1" }.should route_to(:controller => "followings", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/followings/1/edit" }.should route_to(:controller => "followings", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/followings" }.should route_to(:controller => "followings", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/followings/1" }.should route_to(:controller => "followings", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/followings/1" }.should route_to(:controller => "followings", :action => "destroy", :id => "1")
    end

  end
end
