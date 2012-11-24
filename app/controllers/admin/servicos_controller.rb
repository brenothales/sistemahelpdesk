class Admin::ServicosController < ApplicationController
  layout 'admin'
  before_filter :load
  before_filter :load_produto

  def load
    # @pecas = Peca.all
    # @peca =  Peca.new
    # @servicos = Servico.all
    # @servico = Servico.new

  end


  def index
    # sleep 1
    # @incomplete_servicos = Servico.where(completado: false).order('created_at ASC').paginate(:page => params[:page], :per_page => 20)
    # @complete_servicos   = Servico.where(completado:  true).order('created_at ASC').paginate(:page => params[:page], :per_page => 20)

    @servicos = Servico.all
    @servicos = @produto.servicos
    # @servicos_by_date = @servicos.group_by(&:published_on)
    # @date = params[:date] ? Date.parse(params[:date]) : Date.today

     respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @servicos }
    end
  end

  def show
    @servico = Servico.find(params[:id])
    @servico = @produto.servicos.find(params[:id])
    
      respond_to do |format|
        format.html #{ render :layout => ! request.xhr? }
        # Default behavior -> renders show.js.erb
        format.js {}
        format.json { render :json =>  [:admin, @servico] }
      end
  end

  def new
    @servico = Servico.new
    @servico = @produto.servicos.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: [:admin, @servico] }
    end
  end

  def edit
   @servico = @produto.servicos.find(params[:id])
  end

   def create
     @servico = @produto.servicos.build(params[:servico])
     respond_to do |format|
        if @servico.save
         format.html { redirect_to([:admin, @produto, @servico])}
         format.js
         @data_type = :json
       end
     end
   end

  # def update
  #   @servico = Servico.find(params[:id])
  #   @servico.update_attributes!(params[:servico])
  #   respond_to do |format|
  #     format.html { redirect_to admin_servicos_url }
  #     format.js
  #   end
  # end
def update
    @servico = @produto.servicos.find(params[:id])

    respond_to do |format|
      if @servico.update_attributes(params[:servico])
        format.html { redirect_to([:admin, @produto, @servico]) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @servico.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @servico = Servico.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to admin_servicos_url }
      format.js
    end
  end


 protected
  def load_produto
     @produto = Produto.find(params[:produto_id], :include => :servicos)
  end 
end
