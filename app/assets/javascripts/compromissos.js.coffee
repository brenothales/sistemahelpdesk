jQuery ->
  Morris.Line
    element: 'compromissos_chart'
    data: $('#compromissos_chart').data('compromissos')
    xkey: 'published_on'
    ykeys: [' ', 'completado_id', 'incompleto_id']
    labels: [' ', 'Compromisso Completo', 'Compromisso Incompleto']
    preUnits: ' '


jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()


jQuery ->
  $('#compromisso_published_on').datepicker
    dateFormat: 'dd/mm/yy'

jQuery ->
	$.datepicker.regional['pt-BR'] = {
		closeText: 'Fechar',
		prevText: '&#x3c;Anterior',
		nextText: 'Pr&oacute;ximo&#x3e;',
		currentText: 'Hoje',
		monthNames: ['Janeiro','Fevereiro','Mar&ccedil;o','Abril','Maio','Junho',
		'Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
		monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun',
		'Jul','Ago','Set','Out','Nov','Dez'],
		dayNames: ['Domingo','Segunda-feira','Ter&ccedil;a-feira','Quarta-feira','Quinta-feira','Sexta-feira','S&aacute;bado'],
		dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','S&aacute;b'],
		dayNamesMin: ['Dom','Seg','Ter','Qua','Qui','Sex','S&aacute;b'],
		weekHeader: 'Sm',
		dateFormat: 'dd/mm/yy',
		firstDay: 0,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: ''};
	$.datepicker.setDefaults($.datepicker.regional['pt-BR']);


jQuery ($) ->
  
  # JAVASCRIPT FOR THE INDEX PAGE
  
  # Callback for rendering via JSON
  $(".article a[data-type=json]").on "ajax:success", (event, data, status, xhr) ->
    $(this).parents("div.article").find(".details").html "<div class='modal hide fade' id='myMail'>Assunto: " + data.nome + "</div>" + "<div>Observação: " + data.observacao + "</div>"

  
  # Callbacks for rendering via HTML
  $(".article a[data-type=html]").on "ajax:success", (event, data, status, xhr) ->
    $(this).parents("div.article").find(".details").html data

  
  # Handle any AJAX errors (via JS, via JSON or via HTML)
  $(".article a").on "ajax:error", (event, xhr, status, error) ->
    alert "error: " + error

  
  # Handle the hide functionality
  $(".article a.hide").on "click", (event) ->
    event.preventDefault()
    $(this).parents("div.article").find(".details").empty()
    false

  
  # JAVASCRIPT FOR THE NEW ARTICLE PAGE
  
  # Parse the JSON response and replace the <form> with the successfully created article
  $("form.new_article").on "ajax:success", (event, data, status, xhr) ->
    $(this).replaceWith "<div>Assunto: " + data.nome + "</div>" + "<div>Observação: " + data.observacao + "</div>"

  
  # Parse the JSON response and generate an unordered list of errors, then stick it inside
  # <div class="errors"> which is in our view template
  $("form.new_article").on "ajax:error", (event, xhr, status, error) ->
    responseObject = $.parseJSON(xhr.responseText)
    errors = $("<ul />")
    $.each responseObject, (index, value) ->
      errors.append "<li>" + index + ":" + value + "</li>"

    $(this).find(".errors").html errors





