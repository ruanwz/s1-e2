require 'spec_helper'

describe CommitsController do

  def mock_commit(stubs={})
    @mock_commit ||= mock_model(Commit, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all commits as @commits" do
      Commit.stub(:all) { [mock_commit] }
      get :index
      assigns(:commits).should eq([mock_commit])
    end
  end

  describe "GET show" do
    it "assigns the requested commit as @commit" do
      Commit.stub(:find).with("37") { mock_commit }
      get :show, :id => "37"
      assigns(:commit).should be(mock_commit)
    end
  end

  describe "GET new" do
    it "assigns a new commit as @commit" do
      Commit.stub(:new) { mock_commit }
      get :new
      assigns(:commit).should be(mock_commit)
    end
  end

  describe "GET edit" do
    it "assigns the requested commit as @commit" do
      Commit.stub(:find).with("37") { mock_commit }
      get :edit, :id => "37"
      assigns(:commit).should be(mock_commit)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created commit as @commit" do
        Commit.stub(:new).with({'these' => 'params'}) { mock_commit(:save => true) }
        post :create, :commit => {'these' => 'params'}
        assigns(:commit).should be(mock_commit)
      end

      it "redirects to the created commit" do
        Commit.stub(:new) { mock_commit(:save => true) }
        post :create, :commit => {}
        response.should redirect_to(commit_url(mock_commit))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved commit as @commit" do
        Commit.stub(:new).with({'these' => 'params'}) { mock_commit(:save => false) }
        post :create, :commit => {'these' => 'params'}
        assigns(:commit).should be(mock_commit)
      end

      it "re-renders the 'new' template" do
        Commit.stub(:new) { mock_commit(:save => false) }
        post :create, :commit => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested commit" do
        Commit.should_receive(:find).with("37") { mock_commit }
        mock_commit.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :commit => {'these' => 'params'}
      end

      it "assigns the requested commit as @commit" do
        Commit.stub(:find) { mock_commit(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:commit).should be(mock_commit)
      end

      it "redirects to the commit" do
        Commit.stub(:find) { mock_commit(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(commit_url(mock_commit))
      end
    end

    describe "with invalid params" do
      it "assigns the commit as @commit" do
        Commit.stub(:find) { mock_commit(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:commit).should be(mock_commit)
      end

      it "re-renders the 'edit' template" do
        Commit.stub(:find) { mock_commit(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested commit" do
      Commit.should_receive(:find).with("37") { mock_commit }
      mock_commit.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the commits list" do
      Commit.stub(:find) { mock_commit }
      delete :destroy, :id => "1"
      response.should redirect_to(commits_url)
    end
  end

end
