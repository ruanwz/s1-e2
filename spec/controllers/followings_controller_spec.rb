require 'spec_helper'

describe FollowingsController do

  def mock_following(stubs={})
    @mock_following ||= mock_model(Following, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all followings as @followings" do
      Following.stub(:all) { [mock_following] }
      get :index
      assigns(:followings).should eq([mock_following])
    end
  end

  describe "GET show" do
    it "assigns the requested following as @following" do
      Following.stub(:find).with("37") { mock_following }
      get :show, :id => "37"
      assigns(:following).should be(mock_following)
    end
  end

  describe "GET new" do
    it "assigns a new following as @following" do
      Following.stub(:new) { mock_following }
      get :new
      assigns(:following).should be(mock_following)
    end
  end

  describe "GET edit" do
    it "assigns the requested following as @following" do
      Following.stub(:find).with("37") { mock_following }
      get :edit, :id => "37"
      assigns(:following).should be(mock_following)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created following as @following" do
        Following.stub(:new).with({'these' => 'params'}) { mock_following(:save => true) }
        post :create, :following => {'these' => 'params'}
        assigns(:following).should be(mock_following)
      end

      it "redirects to the created following" do
        Following.stub(:new) { mock_following(:save => true) }
        post :create, :following => {}
        response.should redirect_to(following_url(mock_following))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved following as @following" do
        Following.stub(:new).with({'these' => 'params'}) { mock_following(:save => false) }
        post :create, :following => {'these' => 'params'}
        assigns(:following).should be(mock_following)
      end

      it "re-renders the 'new' template" do
        Following.stub(:new) { mock_following(:save => false) }
        post :create, :following => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested following" do
        Following.should_receive(:find).with("37") { mock_following }
        mock_following.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :following => {'these' => 'params'}
      end

      it "assigns the requested following as @following" do
        Following.stub(:find) { mock_following(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:following).should be(mock_following)
      end

      it "redirects to the following" do
        Following.stub(:find) { mock_following(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(following_url(mock_following))
      end
    end

    describe "with invalid params" do
      it "assigns the following as @following" do
        Following.stub(:find) { mock_following(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:following).should be(mock_following)
      end

      it "re-renders the 'edit' template" do
        Following.stub(:find) { mock_following(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested following" do
      Following.should_receive(:find).with("37") { mock_following }
      mock_following.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the followings list" do
      Following.stub(:find) { mock_following }
      delete :destroy, :id => "1"
      response.should redirect_to(followings_url)
    end
  end

end
