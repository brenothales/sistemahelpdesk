class Setor < ActiveRecord::Base
  belongs_to :unidade
  attr_accessible :codigo, :nome, :sala, :sigla,  :unidade_id, :produto_id, :chamado_id, :nome
  alias_attribute :name, :nome
  # attr_reader :name
  # def name
  # 	self.nome
  # end
  

  def self.for_select
    Unidade.all.map do |unidade|
      [unidade, unidade.unidades.map { |c| [c.id, c.nome] }]
    end
  end
end
