class FederalLegislatorsController < ApplicationController
  before_action :set_federal_legislator, only: [:show, :edit, :update, :destroy]

  # GET /federal_legislators
  # GET /federal_legislators.json
  def index
    @federal_legislators = FederalLegislator.all
  end

  # GET /federal_legislators/1
  # GET /federal_legislators/1.json
  def show
  end

  # GET /federal_legislators/new
  def new
    @federal_legislator = FederalLegislator.new
  end

  # GET /federal_legislators/1/edit
  def edit
  end

  # POST /federal_legislators
  # POST /federal_legislators.json
  def create
    @federal_legislator = FederalLegislator.new(federal_legislator_params)

    respond_to do |format|
      if @federal_legislator.save
        format.html { redirect_to @federal_legislator, notice: 'Federal legislator was successfully created.' }
        format.json { render :show, status: :created, location: @federal_legislator }
      else
        format.html { render :new }
        format.json { render json: @federal_legislator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /federal_legislators/1
  # PATCH/PUT /federal_legislators/1.json
  def update
    respond_to do |format|
      if @federal_legislator.update(federal_legislator_params)
        format.html { redirect_to @federal_legislator, notice: 'Federal legislator was successfully updated.' }
        format.json { render :show, status: :ok, location: @federal_legislator }
      else
        format.html { render :edit }
        format.json { render json: @federal_legislator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /federal_legislators/1
  # DELETE /federal_legislators/1.json
  def destroy
    @federal_legislator.destroy
    respond_to do |format|
      format.html { redirect_to federal_legislators_url, notice: 'Federal legislator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_federal_legislator
      @federal_legislator = FederalLegislator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def federal_legislator_params
      params.require(:federal_legislator).permit(:first_name, :last_name, :enters_office_on, :leaves_office_on)
    end
end
