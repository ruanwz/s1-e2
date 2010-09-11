require 'spec_helper'

describe RepositoryTypesController do

  def mock_repository_type(stubs={})
    @mock_repository_type ||= mock_model(RepositoryType, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all repository_types as @repository_types" do
      RepositoryType.stub(:all) { [mock_repository_type] }
      get :index
      assigns(:repository_types).should eq([mock_repository_type])
    end
  end

  describe "GET show" do
    it "assigns the requested repository_type as @repository_type" do
      RepositoryType.stub(:find).with("37") { mock_repository_type }
      get :show, :id => "37"
      assigns(:repository_type).should be(mock_repository_type)
    end
  end

  describe "GET new" do
    it "assigns a new repository_type as @repository_type" do
      RepositoryType.stub(:new) { mock_repository_type }
      get :new
      assigns(:repository_type).should be(mock_repository_type)
    end
  end

  describe "GET edit" do
    it "assigns the requested repository_type as @repository_type" do
      RepositoryType.stub(:find).with("37") { mock_repository_type }
      get :edit, :id => "37"
      assigns(:repository_type).should be(mock_repository_type)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created repository_type as @repository_type" do
        RepositoryType.stub(:new).with({'these' => 'params'}) { mock_repository_type(:save => true) }
        post :create, :repository_type => {'these' => 'params'}
        assigns(:repository_type).should be(mock_repository_type)
      end

      it "redirects to the created repository_type" do
        RepositoryType.stub(:new) { mock_repository_type(:save => true) }
        post :create, :repository_type => {}
        response.should redirect_to(repository_type_url(mock_repository_type))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved repository_type as @repository_type" do
        RepositoryType.stub(:new).with({'these' => 'params'}) { mock_repository_type(:save => false) }
        post :create, :repository_type => {'these' => 'params'}
        assigns(:repository_type).should be(mock_repository_type)
      end

      it "re-renders the 'new' template" do
        RepositoryType.stub(:new) { mock_repository_type(:save => false) }
        post :create, :repository_type => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested repository_type" do
        RepositoryType.should_receive(:find).with("37") { mock_repository_type }
        mock_repository_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :repository_type => {'these' => 'params'}
      end

      it "assigns the requested repository_type as @repository_type" do
        RepositoryType.stub(:find) { mock_repository_type(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:repository_type).should be(mock_repository_type)
      end

      it "redirects to the repository_type" do
        RepositoryType.stub(:find) { mock_repository_type(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(repository_type_url(mock_repository_type))
      end
    end

    describe "with invalid params" do
      it "assigns the repository_type as @repository_type" do
        RepositoryType.stub(:find) { mock_repository_type(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:repository_type).should be(mock_repository_type)
      end

      it "re-renders the 'edit' template" do
        RepositoryType.stub(:find) { mock_repository_type(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested repository_type" do
      RepositoryType.should_receive(:find).with("37") { mock_repository_type }
      mock_repository_type.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the repository_types list" do
      RepositoryType.stub(:find) { mock_repository_type }
      delete :destroy, :id => "1"
      response.should redirect_to(repository_types_url)
    end
  end

end
