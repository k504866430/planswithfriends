class SocializePlansController < ApplicationController
  # GET /socialize_plans
  # GET /socialize_plans.xml
  def index
    @socialize_plans = SocializePlan.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @socialize_plans }
    end
  end

  # GET /socialize_plans/1
  # GET /socialize_plans/1.xml
  def show
    @socialize_plan = SocializePlan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @socialize_plan }
    end
  end

  # GET /socialize_plans/new
  # GET /socialize_plans/new.xml
  def new
    @socialize_plan = SocializePlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @socialize_plan }
    end
  end

  # GET /socialize_plans/1/edit
  def edit
    @socialize_plan = SocializePlan.find(params[:id])
  end

  # POST /socialize_plans
  # POST /socialize_plans.xml
  def create
    @socialize_plan = SocializePlan.new(params[:socialize_plan])

    respond_to do |format|
      if @socialize_plan.save
        format.html { redirect_to(@socialize_plan, :notice => 'Socialize plan was successfully created.') }
        format.xml  { render :xml => @socialize_plan, :status => :created, :location => @socialize_plan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @socialize_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /socialize_plans/1
  # PUT /socialize_plans/1.xml
  def update
    @socialize_plan = SocializePlan.find(params[:id])

    respond_to do |format|
      if @socialize_plan.update_attributes(params[:socialize_plan])
        format.html { redirect_to(@socialize_plan, :notice => 'Socialize plan was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @socialize_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /socialize_plans/1
  # DELETE /socialize_plans/1.xml
  def destroy
    @socialize_plan = SocializePlan.find(params[:id])
    @socialize_plan.destroy

    respond_to do |format|
      format.html { redirect_to(socialize_plans_url) }
      format.xml  { head :ok }
    end
  end
end
