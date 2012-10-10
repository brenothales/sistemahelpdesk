class Admin::ArchivesController < ApplicationController
  load_and_authorize_resource
  layout 'admin'
  before_filter :authenticate_user!
  
  def index
    @archives = Archive.all
    @archive  = Archive.new
    respond_with @archives, :location => admin_archives_path
  end

  def create
    @archive = Archive.new(params[:archive])
    flash[:notice] = 'Upload efetuado com sucesso !' if @archive.save
    redirect_to admin_archives_path
  end

  def destroy
    @archive = Archive.find(params[:id])
    @archive.destroy
  end
end
