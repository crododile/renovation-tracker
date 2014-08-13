class PropertiesController < ApplicationController
  before_action :require_admin
  before_action :set_property, only: [:compare, :show, :edit, :update, :destroy, :units]

  def compare
    unit_numbers = @property.unit_numbers.to_set
    @manager_inspections = @property.manager_inspections.to_a
    @inspections = @property.inspections.to_a
    
    debugger
    filter = Proc.new do |arr|
      arr.select!{|inspection| unit_numbers.include? inspection.unit_number }
    end
    
    filter.call @manager_inspections
    filter.call @inspections
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
