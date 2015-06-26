class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
		@per_page = 5
		@users = User.paginate(per_page: @per_page, page: params[:page])
		#AGREGAR NUEVO USUARIO
  	@user= User.new
  end

  def new
  	@user= User.new
  end

  def edit
  end

  def show
    respond_to do |format|
      format.html{render :show}
      format.json{
        render json: @user, status: :ok
      }
    end
  end
  def create
  	@user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to :users, notice: 'Usuario Creado Satisfactoriamente' }
        format.json { redirect_to :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: :users.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to :users, notice: 'Venta Actualizada' }
        format.json { redirect_to :users }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end  
  end
  def destroy
   	@user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to :users }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end  	
  end
  private
  def set_user
		@user = User.find(params[:id])
  end
  def user_params
  	params.require(:user).permit(:nombres, :direccion, :telefono, :sexo, :observacion, :email)
  end
end
