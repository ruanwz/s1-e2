require 'spec_helper'

describe PullRequestsController do

  def mock_pull_request(stubs={})
    @mock_pull_request ||= mock_model(PullRequest, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all pull_requests as @pull_requests" do
      PullRequest.stub(:all) { [mock_pull_request] }
      get :index
      assigns(:pull_requests).should eq([mock_pull_request])
    end
  end

  describe "GET show" do
    it "assigns the requested pull_request as @pull_request" do
      PullRequest.stub(:find).with("37") { mock_pull_request }
      get :show, :id => "37"
      assigns(:pull_request).should be(mock_pull_request)
    end
  end

  describe "GET new" do
    it "assigns a new pull_request as @pull_request" do
      PullRequest.stub(:new) { mock_pull_request }
      get :new
      assigns(:pull_request).should be(mock_pull_request)
    end
  end

  describe "GET edit" do
    it "assigns the requested pull_request as @pull_request" do
      PullRequest.stub(:find).with("37") { mock_pull_request }
      get :edit, :id => "37"
      assigns(:pull_request).should be(mock_pull_request)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created pull_request as @pull_request" do
        PullRequest.stub(:new).with({'these' => 'params'}) { mock_pull_request(:save => true) }
        post :create, :pull_request => {'these' => 'params'}
        assigns(:pull_request).should be(mock_pull_request)
      end

      it "redirects to the created pull_request" do
        PullRequest.stub(:new) { mock_pull_request(:save => true) }
        post :create, :pull_request => {}
        response.should redirect_to(pull_request_url(mock_pull_request))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pull_request as @pull_request" do
        PullRequest.stub(:new).with({'these' => 'params'}) { mock_pull_request(:save => false) }
        post :create, :pull_request => {'these' => 'params'}
        assigns(:pull_request).should be(mock_pull_request)
      end

      it "re-renders the 'new' template" do
        PullRequest.stub(:new) { mock_pull_request(:save => false) }
        post :create, :pull_request => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested pull_request" do
        PullRequest.should_receive(:find).with("37") { mock_pull_request }
        mock_pull_request.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :pull_request => {'these' => 'params'}
      end

      it "assigns the requested pull_request as @pull_request" do
        PullRequest.stub(:find) { mock_pull_request(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:pull_request).should be(mock_pull_request)
      end

      it "redirects to the pull_request" do
        PullRequest.stub(:find) { mock_pull_request(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(pull_request_url(mock_pull_request))
      end
    end

    describe "with invalid params" do
      it "assigns the pull_request as @pull_request" do
        PullRequest.stub(:find) { mock_pull_request(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:pull_request).should be(mock_pull_request)
      end

      it "re-renders the 'edit' template" do
        PullRequest.stub(:find) { mock_pull_request(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested pull_request" do
      PullRequest.should_receive(:find).with("37") { mock_pull_request }
      mock_pull_request.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the pull_requests list" do
      PullRequest.stub(:find) { mock_pull_request }
      delete :destroy, :id => "1"
      response.should redirect_to(pull_requests_url)
    end
  end

end
