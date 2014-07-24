class InspectionsController < ApplicationController
  before_action :set_inspection, only: [:show, :edit, :update, :destroy]

  # GET /inspections
  # GET /inspections.json
  def index
    @inspections = Inspection.all
    respond_to do |format|
      format.html
      format.csv { send_data @inspections.to_csv }
      format.xls { send_data @inspections.to_csv(col_sep: "\t")}
    end
  end

  # GET /inspections/1
  # GET /inspections/1.json
  def show
  end

  # GET /inspections/new
  def new
    @inspection = Inspection.new
  end

  # GET /inspections/1/edit
  def edit
  end

  # POST /inspections
  # POST /inspections.json
  def create
    @inspection = Inspection.new(inspection_params)
    _save_images
    respond_to do |format|
      if @inspection.save
        format.html { redirect_to new_inspection_url, notice: 'Inspection was successfully created.' }
        format.json { render :show, status: :created, location: @inspection }
      else
        format.html { render :new }
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inspections/1
  # PATCH/PUT /inspections/1.json
  def update
    _save_images
    respond_to do |format|
      if @inspection.update(inspection_params)
        format.html { redirect_to @inspection, notice: 'Inspection was successfully updated.' }
        format.json { render :show, status: :ok, location: @inspection }
      else
        format.html { render :edit }
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inspections/1
  # DELETE /inspections/1.json
  def destroy
    @inspection.destroy
    respond_to do |format|
      format.html { redirect_to inspections_url, notice: 'Inspection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inspection
      @inspection = Inspection.find(params[:id])
    end
    
    #prepare photos for save
    def image_params
      params.require(:inspection).permit(:image => [])
    end
    
    def _save_images
      image_params["image"] && image_params["image"].each do |img|
        @inspection.inspection_images.build({:inspection_photo => img})
      end
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def inspection_params
      params.require(:inspection).permit(:property, :unit_number, :inspector, :granite, :flooring, :components, :appliances, :inspection_date, :comments)
    end
end
