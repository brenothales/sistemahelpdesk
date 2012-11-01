class Admin::ServicosController < ApplicationController
  layout 'admin'
  def index
    sleep 1
    @incomplete_servicos = Servico.where(completado: false).order('created_at ASC').paginate(:page => params[:page], :per_page => 20)
    @complete_servicos   = Servico.where(completado:  true).order('created_at ASC').paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @servico = Servico.new
  end
  def show
    @servico = Servico.find(params[:id])
    respond_with @servico, :location => admin_servico_path
  end

  def create
    @servico = Servico.create!(params[:servico])
    respond_to do |format|
      format.html { redirect_to admin_servicos_url }
      format.js
    end
  end

  def update
    @servico = Servico.find(params[:id])
    @servico.update_attributes!(params[:servico])
    respond_to do |format|
      format.html { redirect_to admin_servicos_url }
      format.js
    end
  end

  def destroy
    @servico = Servico.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to admin_servicos_url }
      format.js
    end
  end
end
