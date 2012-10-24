class Admin::CommentsController < ApplicationController


def create
  @chamado = Chamado.find(params[:chamado_id])
  @comment = @chamado.comments.build(params[:comment])
  flash[:alert] = 'Fail to receive the comment. Double check the fields.' unless @comment.save
  redirect_to [:admin, @chamado]
end
end
