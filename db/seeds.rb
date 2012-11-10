#coding : utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(:name => 'administrador', :situation => true)
Role.create(:name => 'moderador', :situation => true)
Role.create(:name => 'funcionario', :situation => true)
Role.create(:name => 'cliente', :situation => true)

User.create(:name => 'Breno Thales Araujo',   :email => 'breno.thales@gmail.com', :password => '123456', :situation => true, :role_id => Role.first.id)
User.create(:name => 'Sandra Marta',     :email => 'sandra@gmail.com',  :password => '123456', :situation => true, :role_id => Role.last.id)
User.create(:name => 'Marcos Thomaz',    :email => 'marcos@gmail.com',  :password => '123456', :situation => true, :role_id => Role.last.id)
User.create(:name => 'Mairon Brasil',    :email => 'mairon@gmail.com',  :password => '123456', :situation => true, :role_id => Role.last.id)
User.create(:name => 'Márcio Braga',     :email => 'marcio@gmail.com',  :password => '123456', :situation => true, :role_id => Role.last.id)
User.create(:name => 'Paulo Edson',      :email => 'paulo@gmail.com',   :password => '123456', :situation => true, :role_id => Role.last.id)
User.create(:name => 'Thiago Chaves',    :email => 'thiago@gmail.com',  :password => '123456', :situation => true, :role_id => Role.last.id)
User.create(:name => 'Silvana Andrade' , :email => 'silvana@gmail.com', :password => '123456', :situation => true, :role_id => Role.last.id)


TipoCliente.create nome: "Pessoa Física"
TipoCliente.create nome: "Pessoa Jurídica"
categories = %w(Hospitalar Laboratórial Fisioterápico Ondotológico Farmacéutico Biomédico)
categories.each { |category| Category.create(:name => category, :situation => true) }
