class Admin::UnidadesController < ApplicationController
  layout 'admin'
  load_and_authorize_resource
  before_filter :authenticate_user!
  # GET /unidades
  # GET /unidades.json
  def index
    @unidades = Unidade.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @unidades, :location => admin_unidades_path }
    end
  end

  # GET /unidades/1
  # GET /unidades/1.json
  def show
    @unidade = Unidade.find(params[:id])
    respond_with @unidade, :location => admin_unidade_path
  end

  # GET /unidades/new
  # GET /unidades/new.json
  def new
    @unidade = Unidade.new
  end

  # GET /unidades/1/edit
  def edit
    @unidade = Unidade.find(params[:id])
  end

  # POST /unidades
  # POST /unidades.json
  def create
    @unidade = Unidade.new(params[:unidade])

    respond_to do |format|
      if @unidade.save
        format.html { redirect_to [:admin, @unidade], notice: 'Unidade cadastrada com sucesso.' }
        format.json { render json: @unidade, status: :created, :location => admin_unidades_path }
      else
        format.html { render action: "new" }
        format.json { render json: @unidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /unidades/1
  # PUT /unidades/1.json
  def update
    @unidade = Unidade.find(params[:id])

    respond_to do |format|
      if @unidade.update_attributes(params[:unidade])
        format.html { redirect_to [:admin, @unidade], notice: 'Unidade atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @unidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unidades/1
  # DELETE /unidades/1.json
  def destroy
    @unidade = Unidade.find(params[:id])
    @unidade.destroy

    respond_to do |format|
      format.html { redirect_to admin_unidades_url }
      format.json { head :no_content }
    end
  end
end
