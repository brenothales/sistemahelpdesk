class Compromisso < ActiveRecord::Base
	belongs_to :chamado
	attr_accessible :descricacao, :nome, :chamado_id, :produto_id, :pecas_attributes, :valorServico, :observacao, :completado, :numero_os, :retirado, :descricao,
                  :setor_id, :cliente_id, :funcionario_id, :nome, :statu_id, :laudo, :solucao, :published_on

  def contar_id
    id.try(:id)
  end
 
  def contar_id=(id)
    self.id = Compromisso.find_by_id(id) if id.present?
  end




  def self.chart_data(start = 3.weeks.ago)
    total_ids = ids_by_day(start)
    completado_ids = where(completado: true).ids_by_day(start)
    incompleto_ids = where(completado: false).ids_by_day(start)
    (start.to_date..Date.today).map do |date|
      {
        published_on: date,
        contar_id: total_ids[date] || 0,
        completado_id: completado_ids[date] || 0,
        incompleto_id: incompleto_ids[date] || 0
      }
    end
  end

  def self.ids_by_day(start)
    servicos = where(published_on: start.beginning_of_day..Time.zone.now)
    servicos = servicos.group("date(published_on)")
    servicos = servicos.select("published_on, sum(id) as total_id")
    servicos.each_with_object({}) do |servico, ids|
      ids[servico.published_on.to_date] = servico.total_id
    end
  end
end
