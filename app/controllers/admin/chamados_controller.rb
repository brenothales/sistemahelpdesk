class Admin::ChamadosController < ApplicationController
  layout 'admin'
  load_and_authorize_resource
  before_filter :authenticate_user!
  def index
    @chamados = Chamado.all
    @produtos = Produto.all
    @produto = Produto.new
    respond_with @chamados, :location => admin_chamados_path
  end

  def show
    @chamado = Chamado.find(params[:id])
    @user = User.find( @chamado.user_id )
    @cliente = Cliente.find_by_user_id( @user.id )
    respond_with @chamado, @user, @cliente, :location => admin_chamado_path
  end

  def new
    @chamado = Chamado.new
    @chamado.build_produto
    @users = User.all

    @produto = Produto.new   
    @produtos = Produto.all
     respond_with [@chamado, @produtos] 
  end

  def edit
    @chamado = Chamado.find(params[:id])
    @produto = Produto.find( @chamado.produto_id )
    # @produto = Produto.new
    @chamado.build_produto
    @users = User.all
  end

  def create
    @chamado = Chamado.new(params[:chamado])  
    @users = User.all
    flash[:notice] = "Chamado salvo com sucesso!" if @chamado.save
    respond_with @chamado, :location => [:admin, @chamado]
  end

  def update
    @chamado = Chamado.find(params[:id])
    @produto = Produto.find( @chamado.produto_id )
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


# class Admin::ChamadosController < ApplicationController
#   layout 'admin'
#   # GET /chamados
#   # GET /chamados.json
#   def index
#     @chamados = Chamado.all

#     respond_to do |format|
#       format.html # index.html.erb
#       format.json { render json: @chamados }
#     end
#   end

#   # GET /chamados/1
#   # GET /chamados/1.json
#   def show
#     @chamado = Chamado.find(params[:id])

#     respond_to do |format|
#       format.html # show.html.erb
#       format.json { render json: @chamado }
#     end
#   end

#   # GET /chamados/new
#   # GET /chamados/new.json
#   def new
#     @chamado = Chamado.new

#     respond_to do |format|
#       format.html # new.html.erb
#       format.json { render json: @chamado }
#     end
#   end

#   # GET /chamados/1/edit
#   def edit
#     @chamado = Chamado.find(params[:id])
#   end

#   # POST /chamados
#   # POST /chamados.json
#   def create
#     @chamado = Chamado.new(params[:chamado])

#     respond_to do |format|
#       if @chamado.save
#         format.html { redirect_to @chamado, notice: 'Chamado was successfully created.' }
#         format.json { render json: @chamado, status: :created, location: @chamado }
#       else
#         format.html { render action: "new" }
#         format.json { render json: @chamado.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PUT /chamados/1
#   # PUT /chamados/1.json
#   def update
#     @chamado = Chamado.find(params[:id])

#     respond_to do |format|
#       if @chamado.update_attributes(params[:chamado])
#         format.html { redirect_to @chamado, notice: 'Chamado was successfully updated.' }
#         format.json { head :no_content }
#       else
#         format.html { render action: "edit" }
#         format.json { render json: @chamado.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /chamados/1
#   # DELETE /chamados/1.json
#   def destroy
#     @chamado = Chamado.find(params[:id])
#     @chamado.destroy

#     respond_to do |format|
#       format.html { redirect_to chamados_url }
#       format.json { head :no_content }
#     end
#   end
# end
