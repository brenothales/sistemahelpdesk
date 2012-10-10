#encoding : utf-8
module TwitterBootstrapHelper

    class BootstrapLinkRenderer < ::WillPaginate::ActionView::LinkRenderer
      protected

      def html_container(html)
        tag :div, tag(:ul, html), container_attributes
      end

      def page_number(page)
        tag :li, link(page, page, :rel => rel_value(page)), :class => ('active' if page == current_page)
      end

      def gap
        tag :li, link(super, '#'), :class => 'disabled'
      end

      def previous_or_next_page(page, text, classname)
        tag :li, link(text, page || '#'), :class => [classname[0..3], classname, ('disabled' unless page)].join(' ')
      end
    end

    def page_navigation_links(pages)
      will_paginate(pages, :class => 'pagination pagination-right', :inner_window => 0, :outer_window => 0, :renderer => BootstrapLinkRenderer, :previous_label => '&larr;'.html_safe, :next_label => '&rarr;'.html_safe)
    end

  #form helpers

  #input and label for field in form
  def form_field_control_label_and_input(object, field, input, options = {})
    label_name = options[:label_name].nil? ? field.to_s.camelize : options[:label_name]
    content_tag(:div,:class => 'control-group') do
      label(object, field, label_name,:class => 'control-label') +
      content_tag(:div, input, :class => 'controls')
    end                
  end

  def show_select(form, objetos, options = {})
    clazz = objetos.first.class.to_s.downcase.underscore
    field = "#{clazz}_id".to_sym
    label_name = options[:label_name].nil? ? field.to_s.camelize : options[:label_name]
    #html = 
    #html << 
    label(clazz, field, label_name,:class => 'control-label') +
    content_tag(:div, :class => 'control-group') do 
      content_tag(:div,form.collection_select(field, objetos, :id, :name, :prompt => 'Selecione...'), :class => 'controls') 
    end
  end

  #submit and back buttons in create forms
  def submit_and_back_buttons(back_route, options = {})
    label_name = options[:label_name] unless options[:label_name].nil? || options[:label_name].blank?
    content_tag(:div, :class => 'control-group') do
      content_tag(:div,
                  tag(:input, :type => 'submit', :class => 'btn', :value => label_name) +
                  link_to("<i class=\"icon-white icon-arrow-left\"></i> Voltar".html_safe, back_route, :class => 'btn btn-inverse',:title => 'voltar'),
                  :class => 'controls btn-group')
    end
  end

  #submit and back buttons in edit forms
  def back_button(back_route)
    link_to("<i class=\"icon-white icon-arrow-left\"></i> Voltar".html_safe, back_route, :class => 'btn btn-inverse',:title => 'voltar')
  end

  #files in show pages
  def show_field_value(column_name, column_value)
    content_tag(:tr) do 
      content_tag(:td, column_name.to_s.camelize) +
      content_tag(:td, column_value)
    end  
  end

  #create a menu in nav-menu
  def nav_menu(nav_class = 'nav', &block)
    content_tag(:ul, :class => nav_class) do 
      capture(&block) #yield
    end
  end

  #create a menu item link like'Categories'
  def nav_menu_item(menu_label, &block)
    menu_label = t("activerecord.models.#{menu_label}")
    content_tag(:li, :class => 'dropdown') do 
      link_to("#{menu_label} <b class='caret'></b>".html_safe, '#', :class => 'dropdown-toggle', :data => { :toggle => 'dropdown' }) +
      content_tag(:ul, :class => 'dropdown-menu') do 
          capture(&block)#yield
      end
    end
  end

  #create a sub_menu link like 'List Categories'
  def nav_sub_menu_item(sub_menu_label, permission, route = '#', title = '')
    model_name = route.gsub(/(new|path|admin|_|\/)/, '').strip.capitalize.singularize.constantize
    controller = route.gsub(/(new|path|admin|_|\/)/, '').strip.downcase.underscore.pluralize
    sub_menu_label = t("activerecord.models.#{sub_menu_label}")
    action, sub_menu_label = permission.eql?(:create) ? [:new, "Cadastrar #{sub_menu_label}"] : [:index, "Listar #{sub_menu_label}"]
    new_route  = { :controller => "admin/#{controller}", :action => action }
    
    if can? permission, model_name
      content_tag(:li) do 
        link_to(sub_menu_label, new_route, :title => title)
      end
    end
  end

  #when the list is empty...
  def alert_list_empty
    content_tag(:div,:class => 'alert') do 
      content_tag(:button,'x',:class => 'close', data: { dismiss: "alert"})
      content_tag(:h3, 'Não há registros')
    end
  end

  #form search on index pages
  def form_search(route_for_new, route_for_search, title)
    render 'admin/shared/form_search', :route_for_new => route_for_new, :route_for_search => route_for_search, :title => title
  end

  #show actions for register link 'edit, show, delete, details'
  def show_actions(objeto)
    objeto_for_route = objeto.class.to_s.downcase.underscore.pluralize
    content_tag(:td,:class => 'actions btn-group') do
      link_to("<i class=\"icon-list-alt\"></i> Detalhes".html_safe,"/admin/#{objeto_for_route}/#{objeto.id}",:class => 'btn') +
      link_to("<i class=\"icon-refresh\"></i> Editar".html_safe, "/admin/#{objeto_for_route}/#{objeto.id}/edit",:class => 'btn') +
      link_to("<i class=\"icon-trash\"></i> Excluir".html_safe, "/admin/#{objeto_for_route}/#{objeto.id}", method: :delete, data: { confirm: 'Deseja Realmente excluir ?' },:class => 'btn')
    end
  end

  #show flash message on top with de message dãr
  def show_flash(flash)   
    unless flash.nil? || flash.empty?
      clazz = case flash.first.first
        when :notice ; 'alert alert-success'
        when :alert ; 'alert alert-error'
      end
      content_tag(:div, :class => clazz) do 
        content_tag(:button,'x',:class => 'close', data: { dismiss: "alert"}) + 
        content_tag(:h3, flash.first.second)
      end
    end     
  
  end

  #create a link to situation, using pjax to not refresh the page
  #NEED REFACTORY !
  def link_to_situation(objeto)
    html = %()
    #rota = objeto.class.to_s.downcase.pluralize.underscore
    if objeto.respond_to? :situation
      if objeto.situation
        html << link_to("<i class=\"icon-remove\"></i> Desativar".html_safe,{:objeto_id => objeto.id, :model_name => objeto.class.to_s},
              {:alt => "ação : desativar",
              :title => "ação desativar registro",
              :class => "btn btn-danger"})
      else
        html << link_to("<i class=\"icon-ok\"></i> Ativar".html_safe, {:objeto_id => objeto.id, :model_name => objeto.class.to_s},
              {:alt => "ação : ativar",
              :title => "ação ativar registro",
              :class => "btn btn-success"})
      end
    end
    html.html_safe
  end

  #show ordenation field on the attr
  #NEED FIX
  def show_ordenation(field)
    content_tag(:span, :class => 'pull-right') do 
      link_to("<i class='icon-arrow-up'></i>".html_safe, {:order_by => field, :ordem => 'ASC'}, :class => 'ordem_asc') +
      link_to("&nbsp;<i class='icon-arrow-down'></i>".html_safe, {:order_by => field, :order => 'DESC'}, :class => 'ordem_desc')
    end
  end

  #show how many itens per page using pjax to not reload the page
  def itens_per_page
    content_tag(:div, :class => 'btn-group', :style => 'display:inline-block;') do 
      link_to("por página <span class='caret'></span>".html_safe, 'javascript:void(0)', :class => 'btn dropdown-toggle',:data => {:toggle => 'dropdown'}) +
      content_tag(:ul, :class => 'dropdown-menu') do 
        content_tag(:li, link_to('3', {:per_page => 3})) +
        content_tag(:li, link_to('5', {:per_page => 5})) +
        content_tag(:li, link_to('10', {:per_page => 10})) + 
        content_tag(:li, link_to('20', {:per_page => 20}))  
      end
    end
  end

  #list all register in index page
  def table_list(objetos)
    render '/admin/shared/table_list', :objects => objetos
  end

end
