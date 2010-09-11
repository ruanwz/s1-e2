class PullRequestsController < ApplicationController
  # GET /pull_requests
  # GET /pull_requests.xml
  def index
    @pull_requests = PullRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pull_requests }
    end
  end

  # GET /pull_requests/1
  # GET /pull_requests/1.xml
  def show
    @pull_request = PullRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pull_request }
    end
  end

  # GET /pull_requests/new
  # GET /pull_requests/new.xml
  def new
    @pull_request = PullRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pull_request }
    end
  end

  # GET /pull_requests/1/edit
  def edit
    @pull_request = PullRequest.find(params[:id])
  end

  # POST /pull_requests
  # POST /pull_requests.xml
  def create
    @pull_request = PullRequest.new(params[:pull_request])

    respond_to do |format|
      if @pull_request.save
        format.html { redirect_to(@pull_request, :notice => 'Pull request was successfully created.') }
        format.xml  { render :xml => @pull_request, :status => :created, :location => @pull_request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pull_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pull_requests/1
  # PUT /pull_requests/1.xml
  def update
    @pull_request = PullRequest.find(params[:id])

    respond_to do |format|
      if @pull_request.update_attributes(params[:pull_request])
        format.html { redirect_to(@pull_request, :notice => 'Pull request was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pull_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pull_requests/1
  # DELETE /pull_requests/1.xml
  def destroy
    @pull_request = PullRequest.find(params[:id])
    @pull_request.destroy

    respond_to do |format|
      format.html { redirect_to(pull_requests_url) }
      format.xml  { head :ok }
    end
  end
end
