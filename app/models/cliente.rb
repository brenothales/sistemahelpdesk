class Cliente < ActiveRecord::Base
  FIELDS_LISTS  = [ :nome, :cnpj ]
  SEARCH_FIELDS = [ :nome_cont, :cnpj_cont ]

  attr_accessible :cep, :cpf, :cnpj, :nome, :observacao, :user_id, :endereco, :logradouro, 
                  :endereco_attributes, :endereco_id, 
                  :contato_telefones, :contato_telefones_attributes,
                  :tipo_cliente_id, :contato_emails_attributes, :sexo, :funcao, :dataNascimento, :rg
  

  belongs_to :user
  belongs_to :tipo_cliente
  has_one :setor
  has_one :endereco
  accepts_nested_attributes_for :endereco 

  has_many :contato_telefones, :dependent => :destroy
  has_many :chamados, :dependent => :destroy
  accepts_nested_attributes_for :contato_telefones, :reject_if => proc{|a| a["numero"].blank? }
  
  has_many :contato_emails, :dependent => :destroy
  accepts_nested_attributes_for :contato_emails, :reject_if => proc{|a| a["email"].blank? }

  validates_presence_of  :endereco, :tipo_cliente_id 
  validates :cnpj, :presence => true, :if => :is_pj?
  validates :cpf, :sexo, :funcao, :dataNascimento, :rg, :presence => true, :if => :is_pf?

  SEXO = %w(Masculino Feminino)

  def is_pj?
    self.tipo_cliente_id == 2
  end
  
  def is_pf?
    self.tipo_cliente_id == 1
  end
  
  def telefones
    self.contato_telefones.map{|a| "(#{a.ddd}) #{a.numero}"}
  end
  
  def telefone
    tels = telefones
    tels.length > 0 ? tels.first : "-" 
  end

  # before_save :uppercase_name
  # def uppercase_name
  #   self.nome = self.nome.upcase
  # end

  
end