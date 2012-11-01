class Admin::TasksController < ApplicationController
  layout 'admin'
  def index
    sleep 1
    @incomplete_tasks = Task.where(complete: false).order('created_at DESC')
    @complete_tasks = Task.where(complete: true).order('created_at DESC')
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create!(params[:task])
    respond_to do |format|
      format.html { redirect_to admin_tasks_url }
      format.js
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes!(params[:task])
    respond_to do |format|
      format.html { redirect_to admin_tasks_url }
      format.js
    end
  end

  def destroy
    @task = Task.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to admin_tasks_url }
      format.js
    end
  end
end
