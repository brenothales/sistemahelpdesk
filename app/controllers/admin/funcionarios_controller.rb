class Admin::FuncionariosController < ApplicationController
  # GET /admin/funcionarios

  layout 'admin'
  load_and_authorize_resource
  before_filter :authenticate_user!

  def index
    @funcionarios = Funcionario.all
    respond_with @funcionarios, :location => admin_funcionarios_path
  end

  # GET /admin/funcionarios/1
  # GET /admin/funcionarios/1.json
  def show
    @funcionario = Funcionario.find(params[:id])
    respond_with @funcionario, :location => admin_funcionario_path
  end

  # GET /admin/funcionarios/new
  # GET /admin/funcionarios/new.json
  def new
    @funcionario = Funcionario.new
    @funcionario.contato_telefones.build
    respond_with @funcionario, :location => new_admin_funcionario_path
  end

  # GET /admin/funcionarios/1/edit
  def edit
    @funcionario.contato_telefones.build
    @funcionario = Funcionario.find(params[:id])
    
  end

  # POST /admin/funcionarios
  # POST /admin/funcionarios.json
  def create
    @funcionario = Funcionario.new(params[:funcionario])
     if current_user.is_role?(:administrador) 
     else
    @funcionario.user = current_user 
    end 
    flash[:notice] = "Funcionario salvo com sucesso!" if @funcionario.save
    # respond_with @funcionario, :location => [:admin, @funcionario]
    redirect_to admin_funcionarios_path
  end

  # PUT /admin/funcionarios/1
  # PUT /admin/funcionarios/1.json
  def update
    @funcionario = Funcionario.find(params[:id])

    respond_to do |format|
      if @funcionario.update_attributes(params[:funcionario])
        format.html { redirect_to [:admin, @funcionario], notice: 'Funcionario Atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/funcionarios/1
  # DELETE /admin/funcionarios/1.json
  def destroy
    @funcionario = Funcionario.find(params[:id])
    @funcionario.destroy

    respond_to do |format|
      format.html { redirect_to admin_funcionarios_url }
      format.json { head :no_content }
    end
  end
end
