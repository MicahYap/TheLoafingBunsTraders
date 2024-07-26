class SecuredAssetsController < ApplicationController
  before_action :set_secured_asset, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /secured_assets or /secured_assets.json
  def index
    @secured_assets = SecuredAsset.all
  end

  # GET /secured_assets/1 or /secured_assets/1.json
  def show
  end

  # GET /secured_assets/new
  def new
    @secured_asset = SecuredAsset.new
  end

  # GET /secured_assets/1/edit
  def edit
  end

  # POST /secured_assets or /secured_assets.json
  def create
    @secured_asset = SecuredAsset.new(secured_asset_params)

    respond_to do |format|
      if @secured_asset.save
        format.html { redirect_to secured_asset_url(@secured_asset), notice: "Secured asset was successfully created." }
        format.json { render :show, status: :created, location: @secured_asset }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @secured_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /secured_assets/1 or /secured_assets/1.json
  def update
    respond_to do |format|
      if @secured_asset.update(secured_asset_params)
        format.html { redirect_to secured_asset_url(@secured_asset), notice: "Secured asset was successfully updated." }
        format.json { render :show, status: :ok, location: @secured_asset }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @secured_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /secured_assets/1 or /secured_assets/1.json
  def destroy
    @secured_asset.destroy!

    respond_to do |format|
      format.html { redirect_to secured_assets_url, notice: "Secured asset was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_secured_asset
      @secured_asset = SecuredAsset.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def secured_asset_params
      params.require(:secured_asset).permit(:trader_number, :carrots)
    end
end
