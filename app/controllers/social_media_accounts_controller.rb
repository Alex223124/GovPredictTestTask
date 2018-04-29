class SocialMediaAccountsController < ApplicationController
  before_action :set_social_media_account, only: [:show, :edit, :update, :destroy]

  # GET /social_media_accounts
  # GET /social_media_accounts.json
  def index
    @social_media_accounts = SocialMediaAccount.all
  end

  # GET /social_media_accounts/1
  # GET /social_media_accounts/1.json
  def show
  end

  # GET /social_media_accounts/new
  def new
    @social_media_account = SocialMediaAccount.new
  end

  # GET /social_media_accounts/1/edit
  def edit
  end

  # POST /social_media_accounts
  # POST /social_media_accounts.json
  def create
    @social_media_account = SocialMediaAccount.new(social_media_account_params)

    respond_to do |format|
      if @social_media_account.save
        format.html { redirect_to @social_media_account, notice: 'Social media account was successfully created.' }
        format.json { render :show, status: :created, location: @social_media_account }
      else
        format.html { render :new }
        format.json { render json: @social_media_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /social_media_accounts/1
  # PATCH/PUT /social_media_accounts/1.json
  def update
    respond_to do |format|
      if @social_media_account.update(social_media_account_params)
        format.html { redirect_to @social_media_account, notice: 'Social media account was successfully updated.' }
        format.json { render :show, status: :ok, location: @social_media_account }
      else
        format.html { render :edit }
        format.json { render json: @social_media_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /social_media_accounts/1
  # DELETE /social_media_accounts/1.json
  def destroy
    @social_media_account.destroy
    respond_to do |format|
      format.html { redirect_to social_media_accounts_url, notice: 'Social media account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social_media_account
      @social_media_account = SocialMediaAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def social_media_account_params
      params.require(:social_media_account).permit(:name, :url, :media_type)
    end
end
