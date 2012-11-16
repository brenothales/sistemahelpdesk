class Unidade < ActiveRecord::Base
	has_many :setores, :dependent => :destroy 
	attr_accessible :cnpj, :fone, :nome, :ramal, :sigla, :name

	attr_accessor :name

	def name
		self.nome
	end
end
