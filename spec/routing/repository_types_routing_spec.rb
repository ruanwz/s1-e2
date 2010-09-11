require "spec_helper"

describe RepositoryTypesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/repository_types" }.should route_to(:controller => "repository_types", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/repository_types/new" }.should route_to(:controller => "repository_types", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/repository_types/1" }.should route_to(:controller => "repository_types", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/repository_types/1/edit" }.should route_to(:controller => "repository_types", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/repository_types" }.should route_to(:controller => "repository_types", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/repository_types/1" }.should route_to(:controller => "repository_types", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/repository_types/1" }.should route_to(:controller => "repository_types", :action => "destroy", :id => "1")
    end

  end
end
