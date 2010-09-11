require 'spec_helper'

describe IssueStatusesController do

  def mock_issue_status(stubs={})
    @mock_issue_status ||= mock_model(IssueStatus, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all issue_statuses as @issue_statuses" do
      IssueStatus.stub(:all) { [mock_issue_status] }
      get :index
      assigns(:issue_statuses).should eq([mock_issue_status])
    end
  end

  describe "GET show" do
    it "assigns the requested issue_status as @issue_status" do
      IssueStatus.stub(:find).with("37") { mock_issue_status }
      get :show, :id => "37"
      assigns(:issue_status).should be(mock_issue_status)
    end
  end

  describe "GET new" do
    it "assigns a new issue_status as @issue_status" do
      IssueStatus.stub(:new) { mock_issue_status }
      get :new
      assigns(:issue_status).should be(mock_issue_status)
    end
  end

  describe "GET edit" do
    it "assigns the requested issue_status as @issue_status" do
      IssueStatus.stub(:find).with("37") { mock_issue_status }
      get :edit, :id => "37"
      assigns(:issue_status).should be(mock_issue_status)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created issue_status as @issue_status" do
        IssueStatus.stub(:new).with({'these' => 'params'}) { mock_issue_status(:save => true) }
        post :create, :issue_status => {'these' => 'params'}
        assigns(:issue_status).should be(mock_issue_status)
      end

      it "redirects to the created issue_status" do
        IssueStatus.stub(:new) { mock_issue_status(:save => true) }
        post :create, :issue_status => {}
        response.should redirect_to(issue_status_url(mock_issue_status))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved issue_status as @issue_status" do
        IssueStatus.stub(:new).with({'these' => 'params'}) { mock_issue_status(:save => false) }
        post :create, :issue_status => {'these' => 'params'}
        assigns(:issue_status).should be(mock_issue_status)
      end

      it "re-renders the 'new' template" do
        IssueStatus.stub(:new) { mock_issue_status(:save => false) }
        post :create, :issue_status => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested issue_status" do
        IssueStatus.should_receive(:find).with("37") { mock_issue_status }
        mock_issue_status.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :issue_status => {'these' => 'params'}
      end

      it "assigns the requested issue_status as @issue_status" do
        IssueStatus.stub(:find) { mock_issue_status(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:issue_status).should be(mock_issue_status)
      end

      it "redirects to the issue_status" do
        IssueStatus.stub(:find) { mock_issue_status(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(issue_status_url(mock_issue_status))
      end
    end

    describe "with invalid params" do
      it "assigns the issue_status as @issue_status" do
        IssueStatus.stub(:find) { mock_issue_status(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:issue_status).should be(mock_issue_status)
      end

      it "re-renders the 'edit' template" do
        IssueStatus.stub(:find) { mock_issue_status(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested issue_status" do
      IssueStatus.should_receive(:find).with("37") { mock_issue_status }
      mock_issue_status.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the issue_statuses list" do
      IssueStatus.stub(:find) { mock_issue_status }
      delete :destroy, :id => "1"
      response.should redirect_to(issue_statuses_url)
    end
  end

end
