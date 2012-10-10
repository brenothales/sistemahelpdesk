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

ActiveRecord::Schema.define(:version => 20121009183934) do

  create_table "archives", :force => true do |t|
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name",       :limit => 50
    t.boolean  "situation",                :default => true
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "chamados", :force => true do |t|
    t.string   "assunto"
    t.text     "descricao"
    t.string   "prioridade"
    t.string   "tipoAtendimento"
    t.boolean  "cortesia"
    t.text     "observacao"
    t.boolean  "solucionado"
    t.boolean  "finalizaSolicitacao"
    t.decimal  "valorGeral"
    t.integer  "usuario_id"
    t.integer  "produto_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "chamados", ["produto_id"], :name => "index_chamados_on_produto_id"
  add_index "chamados", ["usuario_id"], :name => "index_chamados_on_usuario_id"

  create_table "clientes", :force => true do |t|
    t.string   "nome"
    t.string   "cnpj"
    t.string   "cpf"
    t.string   "responsavel"
    t.integer  "tipo_cliente_id"
    t.string   "complemento"
    t.string   "rg"
    t.string   "sexo"
    t.date     "dataNascimento"
    t.string   "funcao"
    t.string   "observacao"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "clientes", ["tipo_cliente_id"], :name => "index_clientes_on_tipo_cliente_id"
  add_index "clientes", ["user_id"], :name => "index_clientes_on_user_id"

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
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "contato_telefones", ["cliente_id"], :name => "index_contato_telefones_on_cliente_id"

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
    t.decimal  "valorDespreciacao",                :precision => 10, :scale => 2,                   :null => false
    t.string   "seto",              :limit => 50
    t.text     "observacao"
    t.boolean  "situation",                                                       :default => true
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at",                                                                        :null => false
    t.datetime "updated_at",                                                                        :null => false
  end

  add_index "produtos", ["category_id"], :name => "index_produtos_on_category_id"
  add_index "produtos", ["user_id"], :name => "index_produtos_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.boolean  "situation",  :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "tipo_clientes", :force => true do |t|
    t.string   "nome"
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
