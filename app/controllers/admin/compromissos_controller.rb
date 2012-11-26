class Admin::CompromissosController < ApplicationController


  layout 'admin'
  before_filter :load

  def load
    @pecas = Peca.all
    @peca =  Peca.new
    @servicos = Servico.all
    @servico = Servico.new

  end


  def index
    sleep 1
    @incomplete_servicos = Servico.where(completado: false).order('created_at ASC').paginate(:page => params[:page], :per_page => 20)
    @complete_servicos   = Servico.where(completado:  true).order('created_at ASC').paginate(:page => params[:page], :per_page => 20)

    @servicos = Servico.all
    @servicos_by_date = @servicos.group_by(&:published_on)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def show
        @servico = Servico.find(params[:id])

        respond_to do |format|
            format.html { render :layout => ! request.xhr? }
            # Default behavior -> renders show.js.erb
            format.js {}
            format.json { render :json =>  @servico }
        end
    end

  def create
    @servico = Servico.create!(params[:servico])
    respond_to do |format|
      format.html { redirect_to admin_servicos_url }
      format.js
      @data_type = :json
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
