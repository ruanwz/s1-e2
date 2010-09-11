class WatchingsController < ApplicationController
  # GET /watchings
  # GET /watchings.xml
  def index
    @watchings = Watching.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @watchings }
    end
  end

  # GET /watchings/1
  # GET /watchings/1.xml
  def show
    @watching = Watching.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @watching }
    end
  end

  # GET /watchings/new
  # GET /watchings/new.xml
  def new
    @watching = Watching.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @watching }
    end
  end

  # GET /watchings/1/edit
  def edit
    @watching = Watching.find(params[:id])
  end

  # POST /watchings
  # POST /watchings.xml
  def create
    @watching = Watching.new(params[:watching])

    respond_to do |format|
      if @watching.save
        format.html { redirect_to(@watching, :notice => 'Watching was successfully created.') }
        format.xml  { render :xml => @watching, :status => :created, :location => @watching }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @watching.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /watchings/1
  # PUT /watchings/1.xml
  def update
    @watching = Watching.find(params[:id])

    respond_to do |format|
      if @watching.update_attributes(params[:watching])
        format.html { redirect_to(@watching, :notice => 'Watching was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @watching.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /watchings/1
  # DELETE /watchings/1.xml
  def destroy
    @watching = Watching.find(params[:id])
    @watching.destroy

    respond_to do |format|
      format.html { redirect_to(watchings_url) }
      format.xml  { head :ok }
    end
  end
end
