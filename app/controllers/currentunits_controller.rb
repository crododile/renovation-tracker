class CurrentunitsController < ApplicationController
  before_action :set_currentunit, only: [:show, :edit, :update, :destroy]

  # GET /currentunits
  # GET /currentunits.json
  def index
    @currentunits = Currentunit.all
  end

  # GET /currentunits/1
  # GET /currentunits/1.json
  def show
  end

  # GET /currentunits/new
  def new
    @currentunit = Currentunit.new
  end

  # GET /currentunits/1/edit
  def edit
  end

  # POST /currentunits
  # POST /currentunits.json
  def create
    @currentunit = Currentunit.new(currentunit_params)

    respond_to do |format|
      if @currentunit.save
        format.html { redirect_to @currentunit, notice: 'Currentunit was successfully created.' }
        format.json { render :show, status: :created, location: @currentunit }
      else
        format.html { render :new }
        format.json { render json: @currentunit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /currentunits/1
  # PATCH/PUT /currentunits/1.json
  def update
    respond_to do |format|
      if @currentunit.update(currentunit_params)
        format.html { redirect_to @currentunit, notice: 'Currentunit was successfully updated.' }
        format.json { render :show, status: :ok, location: @currentunit }
      else
        format.html { render :edit }
        format.json { render json: @currentunit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /currentunits/1
  # DELETE /currentunits/1.json
  def destroy
    @currentunit.destroy
    respond_to do |format|
      format.html { redirect_to currentunits_url, notice: 'Currentunit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currentunit
      @currentunit = Currentunit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def currentunit_params
      params[:currentunit]
    end
end
