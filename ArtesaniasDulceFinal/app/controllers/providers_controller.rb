class ProvidersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_provider, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /providers
  # GET /providers.json
  def index
    @providers = Provider.all
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
  end

  # GET /providers/new
  def new
    @provider = Provider.new
  end

  # GET /providers/1/edit
  def edit

  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(provider_params)

    respond_to do |format|
      if @provider.save
        format.html { redirect_to home_index_path, notice: 'Provider was successfully created.' }
        format.json { render :index, status: :created, location: @provider }
      else
        format.html { render :new }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /providers/1
  # PATCH/PUT /providers/1.json
  def update
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to home_index_path, notice: 'Provider was successfully updated.' }
        format.json { render :index, status: :ok, location: @provider }
      else
        format.html { render :edit }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @provider = Provider.find(params[:provider_ids])
    @provider.destroy()
    respond_to do |format|
      format.html { redirect_to home_index_path, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_multiple

    Provider.destroy(params[:provider_ids])

    respond_to do |format|
      format.html { redirect_to home_index_path }
      format.json { head :no_content }
    end

  end

  def gestion
    render :partial => 'providers/detalles'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(:name_enterprise, :name_pro, :first_name, :last_name, :matter, :location)
    end
end
