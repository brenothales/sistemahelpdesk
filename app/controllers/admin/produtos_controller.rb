class Admin::ProdutosController < ApplicationController
  
  layout 'admin'
  before_filter :authenticate_user!
  before_filter :atualizar_situation, :only => :index
  load_and_authorize_resource



  def index
    @incomplete_servicos = Servico.where(completado: false).order('created_at ASC')
    @produtos = Produto.order(:name).where("name like ?", "%#{params[:term]}%")
    # @produtos = Produto.search(params[:search]).paginate(:per_page => $per_page,:page => params[:page]) comentei para ajudar com plugin database
    respond_with @produtos, :location => admin_produtos_path

  end

  def show
    @produto = Produto.find(params[:id])
    @user = User.find(@produto.user_id)
    respond_with [@produto, @user], :location => admin_produto_path
  end

  def new
    @produto = Produto.new
    @unidades = Unidade.all
    respond_with @produto, :location => new_admin_produto_path
  end

  def edit
    @produto = Produto.find(params[:id])
    @unidades = Unidade.all
  end

  # def create
  #   @produto = Produto.new(params[:produto])
  #   if current_user.is_role?(:administrador) 
  #    else
  #   @produto.user = current_user 
  #   end
    
  #   flash[:notice] = 'Produto salvo com sucesso !' if @produto.save
  #   if @produto.save
  #     @user = User.find(@produto.user_id)
  #   else
  #     @user = User.new
  #   end
  #   respond_with [@produto, @user ], :location => admin_produtos_path
  # end


  def create
    @produto = Produto.new(params[:produto])  
    @users = User.all
    flash[:notice] = "Produto salvo com sucesso!" if @produto.save
    redirect_to admin_produtos_path
  end

  def update
    @produto = Produto.find(params[:id])
    flash[:notice] = 'Produto atualizado com sucesso!' if @produto.update_attributes(params[:produto])
    redirect_to admin_produtos_path
  end

  def destroy
    @produto = Produto.find(params[:id])
    flash[:notice] = 'Produto deletado com sucesso!' if @produto.destroy
    redirect_to admin_produtos_path
  end
def produtouser
  
  @produtos = Produto.where("user_id = ?", (params[:id]))
  respond_with @produtos
end
protected

  def load_categories
    @categories = Category.order(:name => 'ASC')
  end

end
