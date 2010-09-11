require "spec_helper"

describe WatchingsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/watchings" }.should route_to(:controller => "watchings", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/watchings/new" }.should route_to(:controller => "watchings", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/watchings/1" }.should route_to(:controller => "watchings", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/watchings/1/edit" }.should route_to(:controller => "watchings", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/watchings" }.should route_to(:controller => "watchings", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/watchings/1" }.should route_to(:controller => "watchings", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/watchings/1" }.should route_to(:controller => "watchings", :action => "destroy", :id => "1")
    end

  end
end
