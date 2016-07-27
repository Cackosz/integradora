class MattersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_matter, only: [:show, :edit, :update, :destroy]

  # GET /matters
  # GET /matters.json
  def index
    @matter = Matter.all
  end

  # GET /matters/1
  # GET /matters/1.json
  def show
    @provider = Provider.all
  end

  # GET /matters/new
  def new
    @matter = Matter.new
  end

  # GET /matters/1/edit
  def edit
  end

  # POST /matters
  # POST /matters.json
  def create
    @matter = Matter.new(matter_params)

    respond_to do |format|
      if @matter.save
        format.html { redirect_to home_index_path, notice: 'Matter was successfully created.' }
        format.json { render :index, status: :created, location: @matter }
      else
        format.html { render :new }
        format.json { render json: @matter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matters/1
  # PATCH/PUT /matters/1.json
  def update
    respond_to do |format|
      if @matter.update(matter_params)
        format.html { redirect_to home_index_path, notice: 'Matter was successfully updated.' }
        format.json { render :index, status: :ok, location: @matter }
      else
        format.html { render :edit }
        format.json { render json: @matter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matters/1
  # DELETE /matters/1.json
  def destroy
    @matter = Matter.find(params[:matter_ids])
    @matter.destroy()
    respond_to do |format|
      format.html { redirect_to home_index_path, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_multiple

    Matter.destroy(params[:matter_ids])

    respond_to do |format|
      format.html { redirect_to home_index_path }
      format.json { head :no_content }
    end
  end

  def gestion
    @matter = Matter.all
    render :partial => 'matters/detalles'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matter
      @matter = Matter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matter_params
      params.require(:matter).permit(:name_matter, :price, :quantity, :total_inversion, :provider_id)
    end
end
