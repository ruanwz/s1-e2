require 'spec_helper'

describe PullCommitsController do

  def mock_pull_commit(stubs={})
    @mock_pull_commit ||= mock_model(PullCommit, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all pull_commits as @pull_commits" do
      PullCommit.stub(:all) { [mock_pull_commit] }
      get :index
      assigns(:pull_commits).should eq([mock_pull_commit])
    end
  end

  describe "GET show" do
    it "assigns the requested pull_commit as @pull_commit" do
      PullCommit.stub(:find).with("37") { mock_pull_commit }
      get :show, :id => "37"
      assigns(:pull_commit).should be(mock_pull_commit)
    end
  end

  describe "GET new" do
    it "assigns a new pull_commit as @pull_commit" do
      PullCommit.stub(:new) { mock_pull_commit }
      get :new
      assigns(:pull_commit).should be(mock_pull_commit)
    end
  end

  describe "GET edit" do
    it "assigns the requested pull_commit as @pull_commit" do
      PullCommit.stub(:find).with("37") { mock_pull_commit }
      get :edit, :id => "37"
      assigns(:pull_commit).should be(mock_pull_commit)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created pull_commit as @pull_commit" do
        PullCommit.stub(:new).with({'these' => 'params'}) { mock_pull_commit(:save => true) }
        post :create, :pull_commit => {'these' => 'params'}
        assigns(:pull_commit).should be(mock_pull_commit)
      end

      it "redirects to the created pull_commit" do
        PullCommit.stub(:new) { mock_pull_commit(:save => true) }
        post :create, :pull_commit => {}
        response.should redirect_to(pull_commit_url(mock_pull_commit))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pull_commit as @pull_commit" do
        PullCommit.stub(:new).with({'these' => 'params'}) { mock_pull_commit(:save => false) }
        post :create, :pull_commit => {'these' => 'params'}
        assigns(:pull_commit).should be(mock_pull_commit)
      end

      it "re-renders the 'new' template" do
        PullCommit.stub(:new) { mock_pull_commit(:save => false) }
        post :create, :pull_commit => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested pull_commit" do
        PullCommit.should_receive(:find).with("37") { mock_pull_commit }
        mock_pull_commit.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :pull_commit => {'these' => 'params'}
      end

      it "assigns the requested pull_commit as @pull_commit" do
        PullCommit.stub(:find) { mock_pull_commit(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:pull_commit).should be(mock_pull_commit)
      end

      it "redirects to the pull_commit" do
        PullCommit.stub(:find) { mock_pull_commit(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(pull_commit_url(mock_pull_commit))
      end
    end

    describe "with invalid params" do
      it "assigns the pull_commit as @pull_commit" do
        PullCommit.stub(:find) { mock_pull_commit(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:pull_commit).should be(mock_pull_commit)
      end

      it "re-renders the 'edit' template" do
        PullCommit.stub(:find) { mock_pull_commit(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested pull_commit" do
      PullCommit.should_receive(:find).with("37") { mock_pull_commit }
      mock_pull_commit.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the pull_commits list" do
      PullCommit.stub(:find) { mock_pull_commit }
      delete :destroy, :id => "1"
      response.should redirect_to(pull_commits_url)
    end
  end

end
