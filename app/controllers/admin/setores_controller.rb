class Admin::SetoresController < ApplicationController
  layout 'admin'
  load_and_authorize_resource
  before_filter :authenticate_user!

  # GET /setores
  # GET /setores.json
  def index
    @setores = Setor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @setores,  :location => admin_setores_path }
    end
  end

  # GET /setores/1
  # GET /setores/1.json
  def show
    @setor = Setor.find(params[:id])
    respond_with [@setor ], :location => admin_setor_path
  end

  # GET /setores/new
  # GET /setores/new.json
  def new
    @setor = Setor.new
    @unidade = Unidade.new
    respond_with [:admin, @setor] , :location => new_admin_setor_path
  end

  # GET /setores/1/edit
  def edit
    @setor = Setor.find(params[:id])
  end

  # POST /setores
  # POST /setores.json
  def create
    @setor = Setor.new(params[:setor])

    respond_to do |format|
      if @setor.save
        format.html { redirect_to [:admin, @setor], notice: 'Setor cadastrado.' }
        format.json { render json: @setor, status: :created, :location => admin_setores_url }
      else
        format.html { render action: "new" }
        format.json { render json: @setor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /setores/1
  # PUT /setores/1.json
  def update
    @setor = Setor.find(params[:id])

    respond_to do |format|
      if @setor.update_attributes(params[:setor])
        format.html { redirect_to [:admin, @setores], notice: 'Setor Atualizando com Sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @setor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setores/1
  # DELETE /setores/1.json
  def destroy
    @setor = Setor.find(params[:id])
    @setor.destroy

    respond_to do |format|
      format.html { redirect_to admin_setores_url }
      format.json { head :no_content }
    end
  end
end
