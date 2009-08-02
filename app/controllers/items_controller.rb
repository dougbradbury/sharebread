class ItemsController < ApplicationController
  # GET /items
  # GET /items.xml
  def index
    @drive = Drive.find_by_id(params[:drive_id])
    @items = @drive.items

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @drive = Drive.find_by_id(params[:drive_id])
    @item = Item.new
    @item.drive = @drive

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
    @drive = @item.drive
  end

  # POST /items
  # POST /items.xml
  def create
    @drive = Drive.find_by_id(params[:drive_id])
    @item = @drive.items.build(params[:item])

    respond_to do |format|
      if @item.save
        flash[:notice] = 'Items was successfully created.'
        format.html { redirect_to(drive_items_url(@drive)) }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])
    @drive = @item.drive
    
    respond_to do |format|
      if @item.update_attributes(params[:item])
        flash[:notice] = 'Items was successfully updated.'
        format.html { redirect_to(drive_items_url(@item.drive)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @items.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(drive_items_url(@item.drive)) }
      format.xml  { head :ok }
    end
  end
end
