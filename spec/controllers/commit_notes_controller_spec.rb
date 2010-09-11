require 'spec_helper'

describe CommitNotesController do

  def mock_commit_note(stubs={})
    @mock_commit_note ||= mock_model(CommitNote, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all commit_notes as @commit_notes" do
      CommitNote.stub(:all) { [mock_commit_note] }
      get :index
      assigns(:commit_notes).should eq([mock_commit_note])
    end
  end

  describe "GET show" do
    it "assigns the requested commit_note as @commit_note" do
      CommitNote.stub(:find).with("37") { mock_commit_note }
      get :show, :id => "37"
      assigns(:commit_note).should be(mock_commit_note)
    end
  end

  describe "GET new" do
    it "assigns a new commit_note as @commit_note" do
      CommitNote.stub(:new) { mock_commit_note }
      get :new
      assigns(:commit_note).should be(mock_commit_note)
    end
  end

  describe "GET edit" do
    it "assigns the requested commit_note as @commit_note" do
      CommitNote.stub(:find).with("37") { mock_commit_note }
      get :edit, :id => "37"
      assigns(:commit_note).should be(mock_commit_note)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created commit_note as @commit_note" do
        CommitNote.stub(:new).with({'these' => 'params'}) { mock_commit_note(:save => true) }
        post :create, :commit_note => {'these' => 'params'}
        assigns(:commit_note).should be(mock_commit_note)
      end

      it "redirects to the created commit_note" do
        CommitNote.stub(:new) { mock_commit_note(:save => true) }
        post :create, :commit_note => {}
        response.should redirect_to(commit_note_url(mock_commit_note))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved commit_note as @commit_note" do
        CommitNote.stub(:new).with({'these' => 'params'}) { mock_commit_note(:save => false) }
        post :create, :commit_note => {'these' => 'params'}
        assigns(:commit_note).should be(mock_commit_note)
      end

      it "re-renders the 'new' template" do
        CommitNote.stub(:new) { mock_commit_note(:save => false) }
        post :create, :commit_note => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested commit_note" do
        CommitNote.should_receive(:find).with("37") { mock_commit_note }
        mock_commit_note.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :commit_note => {'these' => 'params'}
      end

      it "assigns the requested commit_note as @commit_note" do
        CommitNote.stub(:find) { mock_commit_note(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:commit_note).should be(mock_commit_note)
      end

      it "redirects to the commit_note" do
        CommitNote.stub(:find) { mock_commit_note(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(commit_note_url(mock_commit_note))
      end
    end

    describe "with invalid params" do
      it "assigns the commit_note as @commit_note" do
        CommitNote.stub(:find) { mock_commit_note(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:commit_note).should be(mock_commit_note)
      end

      it "re-renders the 'edit' template" do
        CommitNote.stub(:find) { mock_commit_note(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested commit_note" do
      CommitNote.should_receive(:find).with("37") { mock_commit_note }
      mock_commit_note.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the commit_notes list" do
      CommitNote.stub(:find) { mock_commit_note }
      delete :destroy, :id => "1"
      response.should redirect_to(commit_notes_url)
    end
  end

end
