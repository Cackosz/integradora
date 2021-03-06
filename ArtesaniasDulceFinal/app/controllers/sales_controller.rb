class SalesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
    @pieces = Piece.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    @pieces = Piece.all
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)
    respond_to do |format|
      if @sale.save
        format.html { redirect_to home_index_path, notice: 'Sale was successfully created.' }
        format.json { render :index, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to home_index_path, notice: 'Sale was successfully updated.' }
        format.json { render :index, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale = Sale.find(params[:sales_ids])
    @sale.destroy()
    respond_to do |format|
      format.html { redirect_to home_index_path, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_multiple

    Sale.destroy(params[:sales_ids])

    respond_to do |format|
      format.html { redirect_to home_index_path }
      format.json { head :no_content }
    end

  end

  def gestion
    @sales = Sale.all
    @pieces = Piece.all
    render partial: 'sales/detalles'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:piece_id, :sale_quantity, :total)
    end
end
