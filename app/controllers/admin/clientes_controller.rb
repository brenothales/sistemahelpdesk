class Admin::ClientesController < ApplicationController
  layout 'admin'
  load_and_authorize_resource
  before_filter :authenticate_user!
  
  def index
    @clientes = Cliente.all
    @users = User.all
    @cliente = Cliente.new
    @cliente_novo = current_user.id


    
    respond_with @clientes, :location => admin_clientes_path
  end

  def show
    @cliente = Cliente.find(params[:id])
    respond_with @cliente, :location => admin_cliente_path
  end

  def new
    @cliente = Cliente.new
    @cliente.build_endereco
    @cliente.contato_telefones.build
    @cliente.contato_emails.build
    respond_with @cliente, :location => new_admin_cliente_path
  end

  def edit
    @cliente = Cliente.find(params[:id])
    @cliente.build_endereco if @cliente.endereco.nil?
    @cliente.contato_telefones.build
    @cliente.contato_emails.build
    

  end

  def create
    @cliente = Cliente.new(params[:cliente])
     if current_user.is_role?(:administrador) 
     else
    @cliente.user = current_user 
    end 
    flash[:notice] = "Cliente salvo com sucesso!" if @cliente.save
    # respond_with @cliente, :location => [:admin, @cliente]
    redirect_to admin_clientes_path
  end

  def update
    @cliente = Cliente.find(params[:id])
    flash[:notice] = "Cliente atualizado com sucesso!" if @cliente.update_attributes(params[:cliente])
    redirect_to admin_clientes_path
  end

  def destroy
    @cliente = Cliente.find(params[:id])
    flash[:notice] = 'Categoria deletado com sucesso' if @cliente.destroy
    redirect_to admin_clientes_path
  end
end
