class Admin::CommentsController < ApplicationController


   def create
	  @chamado = Chamado.find(params[:chamado_id])
	  @comment = @chamado.comments.build(params[:comment])
	  flash[:alert] = 'Oops! :( Por favor descreva seu chamado' unless @comment.save
	  redirect_to [:admin, @chamado]
	end
end
