module Admin::AdminHelper
  
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

 
  def section(title="", &block)
    content_tag :div, :class => "section" do
      html = ""
      html += content_tag :h3, title if title.present?
      html += content_tag :div, :class => "in", &block
    end
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
    link_to t("destroy"), url, html_options
  end

  def section(title="", &block)
    content_tag :div, :class => "section" do
      html = ""
      html += content_tag :h3, title if title.present?
      html += content_tag :div, :class => "in", &block
    end
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
    link_to t("destroy"), url, html_options
  end

  def section(title="", &block)
    content_tag :div, :class => "section" do
      html = ""
      html += content_tag :h3, title if title.present?
      html += content_tag :div, :class => "in", &block
    end
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
    link_to t("destroy"), url, html_options
  end

  def section(title="", &block)
    content_tag :div, :class => "section" do
      html = ""
      html += content_tag :h3, title if title.present?
      html += content_tag :div, :class => "in", &block
    end
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
    link_to t("destroy"), url, html_options
  end

  def section(title="", &block)
    content_tag :div, :class => "section" do
      html = ""
      html += content_tag :h3, title if title.present?
      html += content_tag :div, :class => "in", &block
    end
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
    link_to t("destroy"), url, html_options
  end

  def section(title="", &block)
    content_tag :div, :class => "section" do
      html = ""
      html += content_tag :h3, title if title.present?
      html += content_tag :div, :class => "in", &block
    end
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
    link_to t("destroy"), url, html_options
  end

  def section(title="", &block)
    content_tag :div, :class => "section" do
      html = ""
      html += content_tag :h3, title if title.present?
      html += content_tag :div, :class => "in", &block
    end
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
    link_to t("destroy"), url, html_options
  end

  def section(title="", &block)
    content_tag :div, :class => "section" do
      html = ""
      html += content_tag :h3, title if title.present?
      html += content_tag :div, :class => "in", &block
    end
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
    link_to t("destroy"), url, html_options
  end

  def section(title="", &block)
    content_tag :div, :class => "section" do
      html = ""
      html += content_tag :h3, title if title.present?
      html += content_tag :div, :class => "in", &block
    end
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
    link_to t("destroy"), url, html_options
  end

  def section(title="", &block)
    content_tag :div, :class => "section" do
      html = ""
      html += content_tag :h3, title if title.present?
      html += content_tag :div, :class => "in", &block
    end
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
    link_to t("destroy"), url, html_options
  end

  def section(title="", &block)
    content_tag :div, :class => "section" do
      html = ""
      html += content_tag :h3, title if title.present?
      html += content_tag :div, :class => "in", &block
    end
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
    link_to t("destroy"), url, html_options
  end

  def section(title="", &block)
    content_tag :div, :class => "section" do
      html = ""
      html += content_tag :h3, title if title.present?
      html += content_tag :div, :class => "in", &block
    end
  end


end