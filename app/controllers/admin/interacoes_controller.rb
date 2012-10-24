class Admin::InteracoesController < ApplicationController
	def create
	  @chamado = Chamado.find(params[:chamado_id])
	  @interacoes = @chamado.interacoes.build(params[:interacoes])
	  flash[:alert] = 'Fail to receive the interacoes. Double check the fields.' unless @interacoes.save
	  redirect_to [:admin, @chamado ]
	end
end
