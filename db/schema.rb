# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121113032237) do

  create_table "archives", :force => true do |t|
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name",       :limit => 50
    t.boolean  "situation",                :default => true
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "chamado_produtos", :force => true do |t|
    t.integer  "chamado_id"
    t.integer  "produto_id"
    t.integer  "user_id"
    t.text     "observacao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "chamado_produtos", ["chamado_id"], :name => "index_chamado_produtos_on_chamado_id"
  add_index "chamado_produtos", ["produto_id"], :name => "index_chamado_produtos_on_produto_id"
  add_index "chamado_produtos", ["user_id"], :name => "index_chamado_produtos_on_user_id"

  create_table "chamados", :force => true do |t|
    t.string   "assunto"
    t.text     "descricao",           :limit => 30
    t.string   "prioridade",          :limit => 30
    t.string   "tipoAtendimento",     :limit => 30
    t.boolean  "cortesia",                                                         :default => false
    t.text     "observacao"
    t.boolean  "solucionado",                                                      :default => false
    t.boolean  "finalizaSolicitacao",                                              :default => false
    t.boolean  "cancelar",                                                         :default => false
    t.boolean  "querofinalizar",                                                   :default => false
    t.decimal  "valorGeral",                        :precision => 10, :scale => 2
    t.string   "produto",             :limit => 30
    t.string   "status",              :limit => 30
    t.string   "slug"
    t.integer  "user_id"
    t.integer  "setor_id"
    t.integer  "cliente_id"
    t.integer  "funcionario_id"
    t.datetime "created_at",                                                                          :null => false
    t.datetime "updated_at",                                                                          :null => false
  end

  add_index "chamados", ["cliente_id"], :name => "index_chamados_on_cliente_id"
  add_index "chamados", ["funcionario_id"], :name => "index_chamados_on_funcionario_id"
  add_index "chamados", ["setor_id"], :name => "index_chamados_on_setor_id"
  add_index "chamados", ["user_id"], :name => "index_chamados_on_user_id"

  create_table "clientes", :force => true do |t|
    t.string   "nome",            :limit => 50
    t.string   "cnpj",            :limit => 18
    t.string   "cpf",             :limit => 14
    t.string   "responsavel",     :limit => 50
    t.integer  "tipo_cliente_id"
    t.string   "complemento",     :limit => 140
    t.string   "rg",              :limit => 20
    t.string   "sexo",            :limit => 20
    t.string   "dataNascimento",  :limit => 10
    t.string   "funcao",          :limit => 30
    t.text     "observacao"
    t.integer  "user_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "clientes", ["tipo_cliente_id"], :name => "index_clientes_on_tipo_cliente_id"
  add_index "clientes", ["user_id"], :name => "index_clientes_on_user_id"

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "chamado_id"
    t.text     "descricao"
    t.boolean  "finalizarChamado", :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "comments", ["chamado_id"], :name => "index_comments_on_chamado_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "contato_emails", :force => true do |t|
    t.string   "contato"
    t.string   "email"
    t.integer  "cliente_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "contato_emails", ["cliente_id"], :name => "index_contato_emails_on_cliente_id"

  create_table "contato_telefones", :force => true do |t|
    t.string   "DDD"
    t.string   "numero"
    t.string   "ramal"
    t.boolean  "fax"
    t.integer  "cliente_id"
    t.integer  "funcionario_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "contato_telefones", ["cliente_id"], :name => "index_contato_telefones_on_cliente_id"
  add_index "contato_telefones", ["funcionario_id"], :name => "index_contato_telefones_on_funcionario_id"

  create_table "enderecos", :force => true do |t|
    t.string   "logradouro", :limit => 50
    t.string   "numero",     :limit => 50
    t.string   "bairro",     :limit => 50
    t.string   "cidade",     :limit => 50
    t.string   "uf",         :limit => 2
    t.string   "cep",        :limit => 20
    t.integer  "cliente_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "enderecos", ["cliente_id"], :name => "index_enderecos_on_cliente_id"

  create_table "funcionarios", :force => true do |t|
    t.string   "funcao",         :limit => 30
    t.string   "ctps",           :limit => 38
    t.string   "cpf",            :limit => 14
    t.string   "rg",             :limit => 20
    t.string   "sexo",           :limit => 20
    t.string   "curso",          :limit => 20
    t.string   "dataNascimento", :limit => 10
    t.text     "complemento",    :limit => 140
    t.integer  "user_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "funcionarios", ["user_id"], :name => "index_funcionarios_on_user_id"

  create_table "pecas", :force => true do |t|
    t.string   "nome"
    t.string   "codigo"
    t.decimal  "valorPeca",  :precision => 10, :scale => 2
    t.boolean  "trocarPeca",                                :default => false
    t.text     "observacao"
    t.integer  "servico_id"
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.text     "content"
    t.date     "published_at"
    t.boolean  "situation",    :default => true
    t.integer  "author_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "produtos", :force => true do |t|
    t.string   "name",              :limit => 50
    t.string   "modelo",            :limit => 50
    t.string   "marca",             :limit => 50
    t.string   "numeroSerie",       :limit => 150
    t.string   "patrimonio",        :limit => 50
    t.string   "numeroContrato",    :limit => 50
    t.text     "acessorios"
    t.decimal  "valorDespreciacao",                :precision => 10, :scale => 2
    t.string   "seto",              :limit => 50
    t.text     "observacao"
    t.boolean  "situation",                                                       :default => true
    t.integer  "category_id"
    t.integer  "setor_id"
    t.integer  "user_id"
    t.datetime "created_at",                                                                        :null => false
    t.datetime "updated_at",                                                                        :null => false
  end

  add_index "produtos", ["category_id"], :name => "index_produtos_on_category_id"
  add_index "produtos", ["setor_id"], :name => "index_produtos_on_setor_id"
  add_index "produtos", ["user_id"], :name => "index_produtos_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.boolean  "situation",  :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "servicos", :force => true do |t|
    t.string   "nome",         :limit => 30
    t.text     "observacao"
    t.date     "published_on"
    t.boolean  "completado",                                                :default => false, :null => false
    t.decimal  "valorServico",               :precision => 10, :scale => 2
    t.integer  "produto_id"
    t.integer  "chamado_id"
    t.datetime "created_at",                                                                   :null => false
    t.datetime "updated_at",                                                                   :null => false
  end

  create_table "setores", :force => true do |t|
    t.string   "nome"
    t.string   "sala"
    t.string   "sigla"
    t.string   "codigo"
    t.integer  "unidade_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "setores", ["unidade_id"], :name => "index_setores_on_unidade_id"

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.boolean  "complete",   :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "tipo_clientes", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "unidades", :force => true do |t|
    t.string   "nome"
    t.string   "sigla"
    t.string   "fone"
    t.string   "cnpj"
    t.integer  "ramal"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.boolean  "situation",              :default => true
    t.integer  "role_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
