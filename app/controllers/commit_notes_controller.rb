class CommitNotesController < ApplicationController
  # GET /commit_notes
  # GET /commit_notes.xml
  def index
    @commit_notes = CommitNote.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @commit_notes }
    end
  end

  # GET /commit_notes/1
  # GET /commit_notes/1.xml
  def show
    @commit_note = CommitNote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @commit_note }
    end
  end

  # GET /commit_notes/new
  # GET /commit_notes/new.xml
  def new
    @commit_note = CommitNote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @commit_note }
    end
  end

  # GET /commit_notes/1/edit
  def edit
    @commit_note = CommitNote.find(params[:id])
  end

  # POST /commit_notes
  # POST /commit_notes.xml
  def create
    @commit_note = CommitNote.new(params[:commit_note])

    respond_to do |format|
      if @commit_note.save
        format.html { redirect_to(@commit_note, :notice => 'Commit note was successfully created.') }
        format.xml  { render :xml => @commit_note, :status => :created, :location => @commit_note }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @commit_note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /commit_notes/1
  # PUT /commit_notes/1.xml
  def update
    @commit_note = CommitNote.find(params[:id])

    respond_to do |format|
      if @commit_note.update_attributes(params[:commit_note])
        format.html { redirect_to(@commit_note, :notice => 'Commit note was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @commit_note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /commit_notes/1
  # DELETE /commit_notes/1.xml
  def destroy
    @commit_note = CommitNote.find(params[:id])
    @commit_note.destroy

    respond_to do |format|
      format.html { redirect_to(commit_notes_url) }
      format.xml  { head :ok }
    end
  end
end
