class PullCommitsController < ApplicationController
  # GET /pull_commits
  # GET /pull_commits.xml
  def index
    @pull_commits = PullCommit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pull_commits }
    end
  end

  # GET /pull_commits/1
  # GET /pull_commits/1.xml
  def show
    @pull_commit = PullCommit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pull_commit }
    end
  end

  # GET /pull_commits/new
  # GET /pull_commits/new.xml
  def new
    @pull_commit = PullCommit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pull_commit }
    end
  end

  # GET /pull_commits/1/edit
  def edit
    @pull_commit = PullCommit.find(params[:id])
  end

  # POST /pull_commits
  # POST /pull_commits.xml
  def create
    @pull_commit = PullCommit.new(params[:pull_commit])

    respond_to do |format|
      if @pull_commit.save
        format.html { redirect_to(@pull_commit, :notice => 'Pull commit was successfully created.') }
        format.xml  { render :xml => @pull_commit, :status => :created, :location => @pull_commit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pull_commit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pull_commits/1
  # PUT /pull_commits/1.xml
  def update
    @pull_commit = PullCommit.find(params[:id])

    respond_to do |format|
      if @pull_commit.update_attributes(params[:pull_commit])
        format.html { redirect_to(@pull_commit, :notice => 'Pull commit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pull_commit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pull_commits/1
  # DELETE /pull_commits/1.xml
  def destroy
    @pull_commit = PullCommit.find(params[:id])
    @pull_commit.destroy

    respond_to do |format|
      format.html { redirect_to(pull_commits_url) }
      format.xml  { head :ok }
    end
  end
end
