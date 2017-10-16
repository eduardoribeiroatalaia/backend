class EmpresasController < ApplicationController
  before_action :set_empresa, only: [:show, :update, :destroy]

  # GET /empresas
  def index
    if !User.authenticate_by_token(request.headers["uid"], request.headers["client"], request.headers["access-token"]).nil?
      @empresas = Empresa.joins(:kind)

      if !params[:name].nil?
        @empresas = @empresas.where(name: params[:name])
      end

      if !params[:tipo].nil?
        @empresas = @empresas.where(:kinds=>{:description=> params[:tipo]})
      end

      render json: @empresas
    else
      render json: {errors: "Usuario nao logado"},status: :unprocessable_entity
    end
  end

  # GET /empresas/1
  def show
    if !User.authenticate_by_token(request.headers["uid"], request.headers["client"], request.headers["access-token"]).nil?
      render json: @empresa, include: :kind
    else
      render json: {errors: "Usuario nao logado"},status: :unprocessable_entity
    end
  end

  # POST /empresas
  def create
    @empresa = Empresa.new(empresa_params)

    if @empresa.save
      render json: @empresa, status: :created, location: @empresa
    else
      render json: @empresa.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /empresas/1
  def update
    if @empresa.update(empresa_params)
      render json: @empresa
    else
      render json: @empresa.errors, status: :unprocessable_entity
    end
  end

  # DELETE /empresas/1
  def destroy
    @empresa.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = Empresa.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def empresa_params
      params.require(:empresa).permit(:name, :cnpj, :detalhamentos, :tipo)
    end
end
