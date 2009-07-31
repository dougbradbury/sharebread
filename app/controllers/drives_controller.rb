class DrivesController < ApplicationController
  # GET /drives
  # GET /drives.xml
  def index
    @drives = Drive.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @drives }
    end
  end

  # GET /drives/1
  # GET /drives/1.xml
  def show
    @drive = Drive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @drive }
    end
  end

  # GET /drives/new
  # GET /drives/new.xml
  def new
    @drive = Drive.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @drive }
    end
  end

  # GET /drives/1/edit
  def edit
    @drive = Drive.find(params[:id])
  end

  # POST /drives
  # POST /drives.xml
  def create
    @drive = Drive.new(params[:drive])

    respond_to do |format|
      if @drive.save
        flash[:notice] = 'Drive was successfully created.'
        format.html { redirect_to(drive_url(@drive)) }
        format.xml  { render :xml => @drive, :status => :created, :location => @drive }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @drive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /drives/1
  # PUT /drives/1.xml
  def update
    @drive = Drive.find(params[:id])

    respond_to do |format|
      if @drive.update_attributes(params[:drive])
        flash[:notice] = 'Drive was successfully updated.'
        format.html { redirect_to(drive_url(@drive)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @drive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /drives/1
  # DELETE /drives/1.xml
  def destroy
    @drive = Drive.find(params[:id])
    @drive.destroy

    respond_to do |format|
      format.html { redirect_to(drives_url) }
      format.xml  { head :ok }
    end
  end
end
