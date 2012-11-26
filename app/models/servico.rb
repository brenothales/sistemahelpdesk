class Servico < ActiveRecord::Base
 
  attr_accessible :descricacao, :nome, :chamado_id, :produto_id, :pecas_attributes, :valor_Servico, :observacao, :completado, :published_on, :numero_os, :retirado, :descricao,
                  :setor_id, :cliente_id, :funcionario_id, :nome, :statu_id, :laudo, :solucao, :created_at
  belongs_to :chamado
  belongs_to :produto
  belongs_to :cliente
  belongs_to :funcionario
  belongs_to :statu
  has_many :pecas, :dependent => :destroy
  has_many :tarefas, :dependent => :destroy

  accepts_nested_attributes_for :pecas, allow_destroy: true
  
  validates_presence_of :nome
  # validates_numericality_of :valor_Servico, :greater_than => 0, :allow_nil => true



  # scope :completado, where(:completado => true)
  # scope :incompleto, where(:completado => false)
  
  # def self.total_on(date)
  #   where("date(published_on) = ?", date).sum(:valor_Servico)
  # end



  def self.chart_data(start = 3.weeks.ago)
    total_valor_Servicos = valor_Servicos_by_day(start)
    completado_valor_Servicos = where(completado: true).valor_Servicos_by_day(start)
    incompleto_valor_Servicos = where(completado: false).valor_Servicos_by_day(start)
    (start.to_date..Date.today).map do |date|
      {
        created_at: date,
        valor_Servico: total_valor_Servicos[date] || 0,
        completado_valor_Servico: completado_valor_Servicos[date] || 0,
        incompleto_valor_Servico: incompleto_valor_Servicos[date] || 0
      }
    end
  end

  def self.valor_Servicos_by_day(start)
    servicos = where(created_at: start.beginning_of_day..Time.zone.now)
    servicos = servicos.group("date(created_at)")
    servicos = servicos.select("created_at, sum(valor_Servico) as total_valor_Servico")
    servicos.each_with_object({}) do |servico, valor_Servicos|
      valor_Servicos[servico.created_at.to_date] = servico.total_valor_Servico
    end
  end
end


