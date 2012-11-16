class ChamadosController < ApplicationController




  def index
       @chamados = Chamado.order("assunto")
      @chamado = Chamado.find(params[:chamado_id]) if params[:chamado_id]
      respond_with @chamados, :location => admin_chamados_path
  end

  def show
     @chamado = Chamado.find(params[:id])
     respond_with @chamado, :location => chamado_path
  end

  def new
    @chamado = Chamado.new
    @unidades = Unidade.all
    respond_with @chamado, :location => new_admin_chamado_path
  end

  def edit
    @chamado = Chamado.find(params[:id])
    @unidades = Unidade.all
  end

  def create
    @chamado = Chamado.new(params[:chamado])
    flash[:notice] = 'Chamado salvo com sucesso !' if @chamado.save
    respond_with @chamado, :location => new_admin_chamado_path
  end

  def update
    @chamado = Chamado.new(params[:id])
    flash[:notice] = 'Chamado atualizado com sucesso !' if @chamado.update_attributes(params[:chamado])
    respond_with @chamado, :location => admin_chamados_path
  end

  def destroy
    @chamado = Chamado.find(params[:id])
    flash[:notice] = 'Chamado deletado com sucesso!' if @chamado.destroy
    redirect_to admin_chamados_path
  end

protected

  def load_categories
    @categories = Category.order(:name => 'ASC')
  end

end
