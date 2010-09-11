require 'spec_helper'

describe WatchingsController do

  def mock_watching(stubs={})
    @mock_watching ||= mock_model(Watching, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all watchings as @watchings" do
      Watching.stub(:all) { [mock_watching] }
      get :index
      assigns(:watchings).should eq([mock_watching])
    end
  end

  describe "GET show" do
    it "assigns the requested watching as @watching" do
      Watching.stub(:find).with("37") { mock_watching }
      get :show, :id => "37"
      assigns(:watching).should be(mock_watching)
    end
  end

  describe "GET new" do
    it "assigns a new watching as @watching" do
      Watching.stub(:new) { mock_watching }
      get :new
      assigns(:watching).should be(mock_watching)
    end
  end

  describe "GET edit" do
    it "assigns the requested watching as @watching" do
      Watching.stub(:find).with("37") { mock_watching }
      get :edit, :id => "37"
      assigns(:watching).should be(mock_watching)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created watching as @watching" do
        Watching.stub(:new).with({'these' => 'params'}) { mock_watching(:save => true) }
        post :create, :watching => {'these' => 'params'}
        assigns(:watching).should be(mock_watching)
      end

      it "redirects to the created watching" do
        Watching.stub(:new) { mock_watching(:save => true) }
        post :create, :watching => {}
        response.should redirect_to(watching_url(mock_watching))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved watching as @watching" do
        Watching.stub(:new).with({'these' => 'params'}) { mock_watching(:save => false) }
        post :create, :watching => {'these' => 'params'}
        assigns(:watching).should be(mock_watching)
      end

      it "re-renders the 'new' template" do
        Watching.stub(:new) { mock_watching(:save => false) }
        post :create, :watching => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested watching" do
        Watching.should_receive(:find).with("37") { mock_watching }
        mock_watching.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :watching => {'these' => 'params'}
      end

      it "assigns the requested watching as @watching" do
        Watching.stub(:find) { mock_watching(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:watching).should be(mock_watching)
      end

      it "redirects to the watching" do
        Watching.stub(:find) { mock_watching(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(watching_url(mock_watching))
      end
    end

    describe "with invalid params" do
      it "assigns the watching as @watching" do
        Watching.stub(:find) { mock_watching(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:watching).should be(mock_watching)
      end

      it "re-renders the 'edit' template" do
        Watching.stub(:find) { mock_watching(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested watching" do
      Watching.should_receive(:find).with("37") { mock_watching }
      mock_watching.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the watchings list" do
      Watching.stub(:find) { mock_watching }
      delete :destroy, :id => "1"
      response.should redirect_to(watchings_url)
    end
  end

end
