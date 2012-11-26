class Admin::StatusController < ApplicationController
  layout 'admin'
  # GET /status
  # GET /status.json
  def index
    @status = Statu.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @status }
    end
  end

  # GET /status/1
  # GET /status/1.json
  def show
    @statu = Statu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @statu }
    end
  end

  # GET /status/new
  # GET /status/new.json
  def new
    @statu = Statu.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @statu }
    end
  end

  # GET /status/1/edit
  def edit
    @statu = Statu.find(params[:id])
  end

  # POST /status
  # POST /status.json
  def create
    @statu = Statu.new(params[:statu])
    flash[:notice] = 'Status  criado com sucesso!' if @statu.save
    respond_with @statu,:location => [:admin, @statu]
  end

  # PUT /status/1
  # PUT /status/1.json
  def update
    @statu = Statu.find(params[:id])

    respond_to do |format|
      if @statu.update_attributes(params[:statu])
        format.html { redirect_to [:admin, @statu], notice: 'Status atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @statu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status/1
  # DELETE /status/1.json
  def destroy
    @statu = Statu.find(params[:id])
    @statu.destroy

    respond_to do |format|
      format.html { redirect_to admin_status_url }
      format.json { head :no_content }
    end
  end
end
