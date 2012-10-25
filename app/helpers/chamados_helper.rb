module ChamadosHelper

	def confirmar_chamado(back_route, options = {})
    label_name = options[:label_name] unless options[:label_name].nil? || options[:label_name].blank?
    content_tag(:div, :class => 'span12 ') do
      content_tag(:div,
                  tag(:input, :type => 'submit', :id=>"envia", :disabled => true, :class => 'btn btn-large btn-block btn-danger span12', :value => label_name))
    end
  end
end
