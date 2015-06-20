class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
=begin
  Pendientes
  1 - SACAR PRODUCTOS YA AGREGADOS en el Create
  2 - CARGAR PRODUCTOS EN EL EDIT CUANDO SE REALIZE EL FILTRO DEL CREATE
=end
  # GET /sales
  # GET /sales.json
  def index
    @per_page = 5
    @sales = Sale.paginate(per_page: @per_page, page: params[:page])
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    @per_page = 5
    @sale_details = SaleDetail.where(sale_id: @sale.id).paginate(per_page: @per_page, page: params[:page])
     
    @sale_detail = SaleDetail.new
    @products = Product.all
    @sale = Sale.find(params[:id])
    respond_to do |format|      
      format.html{ render :show }
      format.json{
        render json: @product, status: :ok
      }
      format.xlsx {
        #AGREgar excel
        @sale_details = SaleDetail.where(sale_id: @sale.id).paginate(per_page: @per_page, page: params[:page])
        render xlsx: "show", disposition: "attachment", filename: "Venta_No_#{@sale.id}.xlsx"
      }
    end
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    @clients = Client.all
  end

  # GET /sales/1/edit
  def edit
    @clients = Client.all
  end

  # POST /sales
  # POST /sales.json
  def create
    cliente = Client.find(sale_params[:client_id])
    temp = sale_params
    temp["client_id"] = cliente.id
    @sale = Sale.new(temp)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to :sales, notice: 'Venta Creada' }
        format.json { render :show, status: :created, location: @sale }
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
        format.html { redirect_to :sales, notice: 'Venta Actualizada' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
   @sale = Sale.find(params[:id])
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to :sales }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:fecha, :subtotal, :total, :client_id, :user_id, :estado)
    end
end
