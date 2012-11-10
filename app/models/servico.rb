class Servico < ActiveRecord::Base
 
  attr_accessible :descricacao, :nome, :chamado_id, :pecas_attributes, :valorServico, :observacao, :completado, :published_on
  belongs_to :chamado
  has_many :pecas, :dependent => :destroy

  accepts_nested_attributes_for :pecas, allow_destroy: true
  
validates_presence_of :nome, :chamado
  validates_numericality_of :valorServico, :greater_than => 0, :allow_nil => true



  # scope :completado, where(:completado => true)
  # scope :incompleto, where(:completado => false)
  
  # def self.total_on(date)
  #   where("date(published_on) = ?", date).sum(:valorServico)
  # end



  def self.chart_data(start = 3.weeks.ago)
    total_valorServicos = valorServicos_by_day(start)
    completado_valorServicos = where(completado: true).valorServicos_by_day(start)
    incompleto_valorServicos = where(completado: false).valorServicos_by_day(start)
    (start.to_date..Date.today).map do |date|
      {
        published_on: date,
        valorServico: total_valorServicos[date] || 0,
        completado_valorServico: completado_valorServicos[date] || 0,
        incompleto_valorServico: incompleto_valorServicos[date] || 0
      }
    end
  end

  def self.valorServicos_by_day(start)
    servicos = where(published_on: start.beginning_of_day..Time.zone.now)
    servicos = servicos.group("date(published_on)")
    servicos = servicos.select("published_on, sum(valorServico) as total_valorServico")
    servicos.each_with_object({}) do |servico, valorServicos|
      valorServicos[servico.published_on.to_date] = servico.total_valorServico
    end
  end
end


