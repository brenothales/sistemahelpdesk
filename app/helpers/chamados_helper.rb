module ChamadosHelper

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
end
