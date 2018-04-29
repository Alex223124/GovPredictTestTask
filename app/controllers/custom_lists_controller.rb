class CustomListsController < ApplicationController
  before_action :set_custom_list, only: [:show, :edit, :update, :destroy]

  # GET /custom_lists
  # GET /custom_lists.json
  def index
    @custom_lists = CustomList.all
  end

  # GET /custom_lists/1
  # GET /custom_lists/1.json
  def show
  end

  # GET /custom_lists/new
  def new
    @custom_list = CustomList.new
  end

  # GET /custom_lists/1/edit
  def edit
  end

  # POST /custom_lists
  # POST /custom_lists.json
  def create
    @custom_list = CustomList.new(custom_list_params)

    respond_to do |format|
      if @custom_list.save
        format.html { redirect_to @custom_list, notice: 'Custom list was successfully created.' }
        format.json { render :show, status: :created, location: @custom_list }
      else
        format.html { render :new }
        format.json { render json: @custom_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custom_lists/1
  # PATCH/PUT /custom_lists/1.json
  def update
    respond_to do |format|
      if @custom_list.update(custom_list_params)
        format.html { redirect_to @custom_list, notice: 'Custom list was successfully updated.' }
        format.json { render :show, status: :ok, location: @custom_list }
      else
        format.html { render :edit }
        format.json { render json: @custom_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_lists/1
  # DELETE /custom_lists/1.json
  def destroy
    @custom_list.destroy
    respond_to do |format|
      format.html { redirect_to custom_lists_url, notice: 'Custom list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_list
      @custom_list = CustomList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_list_params
      params.require(:custom_list).permit(:title)
    end
end
