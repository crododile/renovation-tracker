class PropertiesController < ApplicationController
  before_action :require_admin
  before_action :set_property, only: [:compare, :show, :edit, :update, :destroy, :units]

  def compare
    @unit_numbers = @property.unit_numbers.to_set
    @manager_inspections = @property.manager_inspections.to_a
    @inspections = @property.current_inspections
    
    @current_inspections = []
    @stack = []
    
    @unit_numbers.each do |num|
      in_we_go = @inspections.find_by_unit_number(num) || Inspection.new({unit_number: num})
      @current_inspections << in_we_go
    end
    
    filter = Proc.new do |arr|
      arr.select!{|inspection| @unit_numbers.include? inspection.unit_number }
    end

    filter.call @manager_inspections
    
    @unit_numbers.each do |num|
      hereArr = []
      hereArr << num
      hereArr << @current_inspections.shift
      hereArr << @manager_inspections.shift

      # collector.call(@current_inspections, num, hereArr)
    #   collector.call(@manager_inspections, num, hereArr)
      if hereArr[-2][:id] == nil
        hereArr << "no-inspection"
      elsif hereArr[-2].eql_manager_inspection(hereArr[-1])
        hereArr << "matches"
      else
        hereArr << "mismatch"
      end
        
      @stack << hereArr 
    end
    
    render "compare"
  end

  def index
    @properties = Property.all
  end

  def show
  end
  
  def units
    render :json => @property.unit_numbers
  end

  def new
    @property = Property.new
  end

  def edit
  end

  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_property
      @property = Property.find(params[:id])
    end

    def property_params
      params[:property]
    end
end
