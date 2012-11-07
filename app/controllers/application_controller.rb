#coding : utf-8
class ApplicationController < ActionController::Base

 
  protect_from_forgery

  before_filter :load_order
  before_filter :load
  respond_to :html, :json, :xml, :js

  def load_order
    $order_by = params[:order_by].nil? ? 'id' : params[:order_by]
    $ordem    = params[:ordem].nil? ? 'DESC' : params[:ordem]
    $per_page = params[:per_page].nil? ? 5 : params[:per_page]
  end

  def admin
    @incomplete_servicos = Servico.where(completado: false).order('created_at ASC').paginate(:page => params[:page], :per_page => 20)
    @complete_servicos   = Servico.where(completado:  true).order('created_at ASC').paginate(:page => params[:page], :per_page => 20)


    @chamado = Chamado.find(params[:id])
    @user = User.find( @chamado.user_id )
    @cliente = Cliente.find_by_user_id( @user.id )
    
  end

  def atualizar_situation
    if params[:objeto_id]
      model_name = params[:model_name].constantize
      objeto = model_name.find(params[:objeto_id])
      if objeto.respond_to? :situation
        objeto.situation = objeto.situation? ? false : true
        objeto.save
      end
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to admin_root_url, :alert => "Usuário não tem permissão para essa ação."
  end


def load
    @pecas = Peca.all
    @peca =  Peca.new
    @servicos = Servico.all
    @servico = Servico.new
    sleep 1
    @incomplete_servicos = Servico.where(completado: false).order('created_at ASC').paginate(:page => params[:page], :per_page => 20)
    @complete_servicos   = Servico.where(completado:  true).order('created_at ASC').paginate(:page => params[:page], :per_page => 20)
  end



end


