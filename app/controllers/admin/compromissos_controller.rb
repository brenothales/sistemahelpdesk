class Admin::CompromissosController < ApplicationController
 layout 'admin'
  before_filter :load

  def load
    @pecas = Peca.all
    @peca =  Peca.new
    @compromissos = Compromisso.all
    @compromisso = Compromisso.new

  end


  def index
    sleep 1
    @incomplete_compromissos = Compromisso.where(completado: false).order('created_at ASC')
    @complete_compromissos   = Compromisso.where(completado:  true).order('created_at ASC')

    @compromissos = Compromisso.all
    @compromissos_by_date = @compromissos.group_by(&:published_on)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def show
        @compromisso = Compromisso.find(params[:id])

        respond_to do |format|
            format.html { render :layout => ! request.xhr? }
            # Default behavior -> renders show.js.erb
            format.js {}
            format.json { render :json =>  @compromisso }
        end
    end

  def create
    @compromisso = Compromisso.create!(params[:compromisso])
    respond_to do |format|
      format.html { redirect_to admin_compromissos_url }
      format.js
      @data_type = :json
    end
  end
def update
    @compromisso = Compromisso.find(params[:id])
    @compromisso.update_attributes!(params[:compromisso])
    respond_to do |format|
      format.html { redirect_to admin_compromissos_url }
      format.js
    end
  end

  def destroy
    @compromisso = Compromisso.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to admin_compromissos_url }
      format.js
    end
  end

end
