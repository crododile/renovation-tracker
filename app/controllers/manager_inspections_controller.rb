class ManagerInspectionsController < ApplicationController
  before_action :validate_manager, only: [:manager_dashboard]
  before_action :set_manager_inspection, only: [:show, :edit, :update, :destroy]

  def index
    @manager_inspections = ManagerInspection.all
    respond_to do |format|
      format.csv { send_data Property.collection_csv(@manager_inspections) }
      format.xls { send_data Property.collection_csv(@manager_inspections, {col_sep: "\t"} )}
    end
  end
  
  def manager_dashboard
    property_name = params[:property].to_s
    @property = Property.find_by_property(property_name)
    @units = []
    inspectionsRelation = ManagerInspection.where(property: property_name)
    @property.unit_numbers.each do |num|
      mi = inspectionsRelation.find_by_unit_number(num)
      if mi
        @units << mi 
      else
        @units << ManagerInspection.
          create({property: property_name, unit_number: num})
      end
    end
  end

  # GET /manager_inspections/1
  # GET /manager_inspections/1.json
  def show
  end

  # GET /manager_inspections/new
  def new
    @manager_inspection = ManagerInspection.new
  end

  # GET /manager_inspections/1/edit
  def edit
  end

  # POST /manager_inspections
  # POST /manager_inspections.json
  def create
    @manager_inspection = ManagerInspection.new(manager_inspection_params)

    respond_to do |format|
      if @manager_inspection.save
        format.html { redirect_to @manager_inspection, notice: 'Manager inspection was successfully created.' }
        format.json { render :show, status: :created, location: @manager_inspection }
      else
        format.html { render :new }
        format.json { render json: @manager_inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manager_inspections/1
  # PATCH/PUT /manager_inspections/1.json
  def update
    respond_to do |format|
      @manager_inspection.attributes = manager_inspection_params
      changed = @manager_inspection.changed[0]
      css = @manager_inspection.get_css_by_agreement(changed)
      if @manager_inspection.update(manager_inspection_params)
        format.html { redirect_to @manager_inspection, notice: 'Manager inspection was successfully updated.' }
        format.json { render json: {changed: changed, css: css }, status: :ok, location: @manager_inspection }
      else
        format.html { render :edit }
        format.json { render json: @manager_inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manager_inspections/1
  # DELETE /manager_inspections/1.json
  def destroy
    @manager_inspection.destroy
    respond_to do |format|
      format.html { redirect_to manager_inspections_url, notice: 'Manager inspection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager_inspection
      @manager_inspection = ManagerInspection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_inspection_params
      params.require(:manager_inspection).permit(:components, :new_countertop, :flooring, :appliances, :paint, :rent_ready, :property, :unit_number)
    end
end
