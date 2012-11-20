class Admin::ChamadosController < ApplicationController
  layout 'admin'
  load_and_authorize_resource
  before_filter :authenticate_user!
  def index
    @chamados = Chamado.all
    @produtos = Produto.all
    @produto = Produto.new
    @unidades = Unidade.all
    
    respond_to do |format|
      format.html
      format.pdf do 
        render :pdf => 'file_name',
               :template => 'admin/chamados/show.pdf.erb',
               :layout => 'pdf',
               :encoding => 'UTF-8'
        end
      end
    # respond_with @chamados, :location => admin_chamados_path
  end

  def show
    @chamado = Chamado.find(params[:id])
    @chamados = Chamado.all
    @user = User.find( @chamado.user_id )
    @cliente = Cliente.find_by_user_id( @user.id )

    respond_to do |format|
      format.html
      format.pdf do 
        render :pdf => 'file_name',
               :template => 'admin/chamados/show.pdf.erb',
               :layout => 'pdf',
               :encoding => 'UTF-8'
        end
      end
  end







    # respond_with @chamado, @user, @cliente, @funcionario, :location => admin_chamado_path


  def new
    @chamado = Chamado.new
    # @chamado.build_produto
    @users = User.all
    @unidades = Unidade.all
    @produto = Produto.new   
    @produtos = Produto.all
     respond_with [@chamado, @produto] 
  end

  def edit
    @chamado = Chamado.find(params[:id])
    # @produto = Produto.find( @chamado.produto_id )
    # @produto = Produto.new
    @unidades = Unidade.all
    # @chamado.build_produto
    @users = User.all
  end

  def create
    @chamado = Chamado.new(params[:chamado])  
    @users = User.all
    flash[:notice] = "Chamado salvo com sucesso!" if @chamado.save
    respond_with @chamado, :location => [:admin, @chamado]
  end

  # def create
  #   @chamado = Chamado.new(params[:chamado])  
  #   @users = User.all
  #   if @chamado.save
  #     flash[:notice] = "Chamado salvo com sucesso!" 
  #   else
  #     format.html { render action: "new" }
  #   end
  #   respond_with @chamado, :location => [:admin, @chamado]
  # end


  def update
    @chamado = Chamado.find(params[:id])
    # @produto = Produto.find( @chamado.produto_id )
    flash[:notice] = "Chamado atualizado com sucesso!" if @chamado.update_attributes(params[:chamado])
    respond_with @chamado, :location => [:admin, @chamado]
  end

  def destroy
    @chamado = Chamado.find(params[:id])
    flash[:notice] = 'Produto deletado com sucesso' if @chamado.destroy
    redirect_to admin_chamados_path
  end
protected
  def load_resources
    @authors    = User.all

  end
end

