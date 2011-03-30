class RailsUrlsController < ApplicationController
  # GET /rails_urls
  # GET /rails_urls.xml
  def index
    @rails_leads = RailsUrl.where(:lead => true, :customer => false)
    @rails_no_leads = RailsUrl.where(:lead => false, :customer => false)
    @rails_customers = RailsUrl.where(:customer => true)
    @rails_leads = @rails_leads.order(:url)
    @rails_no_leads = @rails_no_leads.order(:url)
    @rails_customers = @rails_customers.order(:url)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rails_urls }
    end
  end

  # GET /rails_urls/1
  # GET /rails_urls/1.xml
  def show
    @rails_url = RailsUrl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rails_url }
    end
  end

  # GET /rails_urls/new
  # GET /rails_urls/new.xml
  def new
    @rails_url = RailsUrl.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rails_url }
    end
  end

  # GET /rails_urls/1/edit
  def edit
    @rails_url = RailsUrl.find(params[:id])
  end

  # POST /rails_urls
  # POST /rails_urls.xml
  def create
    @rails_url = RailsUrl.new(params[:rails_url])

    respond_to do |format|
      if @rails_url.save
        format.html { redirect_to(@rails_url, :notice => 'Rails url was successfully created.') }
        format.xml  { render :xml => @rails_url, :status => :created, :location => @rails_url }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rails_url.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rails_urls/1
  # PUT /rails_urls/1.xml
  def update
    @rails_url = RailsUrl.find(params[:id])

    respond_to do |format|
      if @rails_url.update_attributes(params[:rails_url])
#        format.html { redirect_to(@rails_url, :notice => 'Rails url was successfully updated.') }
        format.html { redirect_to(rails_urls_url)}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rails_url.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rails_urls/1
  # DELETE /rails_urls/1.xml
  def destroy
    @rails_url = RailsUrl.find(params[:id])
    @rails_url.destroy

    respond_to do |format|
      format.html { redirect_to(rails_urls_url) }
      format.xml  { head :ok }
    end
  end
end
