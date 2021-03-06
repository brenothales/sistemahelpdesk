#encoding : utf-8
module ApplicationHelper
  
  def link_to_add_campos(name, f, association)
      new_object = f.object.send(association).klass.new
      id = new_object.object_id
      fields = f.fields_for(association, new_object, child_index: id) do |builder|
        render(association.to_s.singularize + "_fields", f: builder)
      end
      link_to(name, '#', class: "add_fields btn", data: {id: id, fields: fields.gsub("\n", "")})
  end

    def servicos_chart_series(servicos, start_time)
    servicos_by_day = servicos.where(:published_on => start_time.beginning_of_day..Time.zone.now.end_of_day).
                    group("date(published_on)").
                    select("published_on, sum(valorServico) as valorServico")
    (start_time.to_date..Date.today).map do |date|
      servico = servicos_by_day.detect { |servico| servico.published_on.to_date == date }
      servico && servico.valorServico.to_f || 0
    end.inspect
  end



  def link_to_add_fields(name, f, association)
      new_object = f.object.send(association).klass.new
      id = new_object.object_id
      fields = f.fields_for(association, new_object, child_index: id) do |builder|
        render(association.to_s.singularize + "_fields", f: builder)
      end
      link_to(name, '#', class: "add_fields btn", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def confirmar_chamado(back_route, options = {})
    label_name = options[:label_name] unless options[:label_name].nil? || options[:label_name].blank?
    content_tag(:div, :class => 'span12 ') do
      content_tag(:div,
                  tag(:input, :type => 'submit', :id=>"envia", :disabled => true, :class => 'btn btn-large btn-block btn-danger span12', :value => label_name))
    end
  end

  def post_date(date)
    # formatting date: Aug, 31 2007 - 9:55PM
    date.strftime("%b, %m %Y - %H:%M")
  end

  def chamados_list
    # não sei se essa é sua lógica mas segue um exemplo
    Chamado.all.map { |chamado| chamado.assunto }.join(' ').html_safe
  end

  def error_message_for(resource)
    render "/admin/shared/error_message",:target => resource
  end

  def show_situation_status(objeto)
    if objeto.is_a?(TrueClass)
      "Ativo no sistema"
    elsif objeto.is_a?(FalseClass) || content.is_a?(NilClass)
      "Desativado no sistema"
    end
  end

  def page_sub_title(sub_title)
    content_for :sub_titulo_pagina do
      content_tag(:h1, sub_title,:class => 'well')
    end
  end

  def list_last_five_categories
    html = %()
    html << content_tag(:li, 'Últimas categorias', :class => 'nav-header')
    Category.last_five.each do |category|
      html << content_tag(:li, link_to(category.name, admin_category_path(category), :title => 'Veja os detalhes'))
    end
    content_tag(:ul, html.html_safe, :class => 'nav nav-list')
  end

  def create_menus
    html = %()
    Util.list_models.each { |model| html << render('admin/shared/menu_item', :model_for_menu => model) }
    html.html_safe
  end



  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function( content_tag(:i, "", :class=>"icon-remove"), "remove_fields(this)", :class => "btn btn-danger remove_field", :style=>"margin-left:30px")
  end
  
  def link_to_add_fields(name, f, association, helper)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(helper, :f => builder)
    end
    content_tag :div, :class => "row" do 
      link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", :class => "btn btn-info", :style => "margin-left:30px")
    end
  end
  
  
  def translate_attribute(model, attribute)
    model.human_attribute_name(attribute)
  end
  
  alias_method :ta, :translate_attribute

  def link_to_new(model, url, html_options = {})
    link_to t("new", :model => model.model_name.human), url, html_options
  end

  def link_to_edit(url, html_options = {})
    html_options.reverse_merge!(:class => "green")
    link_to t("edit"), url, html_options
  end

   def link_to_destroy(url, html_options = {})
    html_options.reverse_merge!(:confirm => t("confirm"), :method => :delete, :class => "red")
    link_to ("destroy"), url, html_options
  end

  def section(title="", &block)
    content_tag :div, :class => "section" do
      html = ""
      html += content_tag :h3, title if title.present?
      html += content_tag :div, :class => "in", &block
    end
  end



end
