class Admin::PecasController < ApplicationController
  # GET /pecas
  # GET /pecas.json
  def index
    @pecas = Peca.all
    @peca = Peca.new  # added
    @total_pecas = Peca.sum(:valorPeca)


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pecas }
    end
  end

  # # GET /pecas/1/edit
  # def edit
  #   @peca = Peca.find(params[:id])
  # end

  # POST /pecas
  # POST /pecas.json
  def create
    @peca = Peca.new(params[:peca])

    respond_to do |format|
      if @peca.save
        format.html { redirect_to @peca, notice: 'Peca was successfully created.' }
        format.json { render json: @peca, status: :created, location: @peca }
        format.js  #added
      else
        format.html { render action: "new" }
        format.json { render json: @peca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pecas/1
  # PUT /pecas/1.json
  def update
    @peca = Peca.find(params[:id])

    respond_to do |format|
      if @peca.update_attributes(params[:peca])
        format.html { redirect_to @peca, notice: 'Peca was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @peca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pecas/1
  # DELETE /pecas/1.json
  def destroy
    @peca = Peca.find(params[:id])
    @peca.destroy
    respond_to do |format|
      format.html { redirect_to pecas_url }
      format.json { head :no_content }
      format.js #added
      end
  end
end
