$(document).ready(function () {
    
    	$("#new_contato").attr("action",  $("#new_contato").attr("action")+".json" );
	
     	$( "#bt-cadastra" )
			.button()
			.click(function() {
				 // document.getElementById('new_contato').reset();
				$( "#dialog-cadastro" ).dialog( "open" );
			});

		clicaTR = function(){
			alert( $(this).attr('data-id') );
		}
		
		$.each( $(".data-row") , function(){ 
			$(this).click(clicaTR);
		});
		addopcao = function(datas, idcombo){
			   var data = datas[0];
			   var dataU = datas[1];
			   var $i=$("<option>");
                    $($i).attr( "value"  ,data.id);
                    $($i).html(data.name);
                    if ( dataU.name == "" ){
                        $(idcombo).append($i);
                    }else{
                        $.each($("#chosen_b optgroup"),function(){
                            if ($(this).attr("label")==dataU.name){
                                $(this).append($i);
                            }
                        });
                    }
		}
		$("#chamado_user_id").change(function(){
		$("#producttest").html('');
		$.ajax({
			url: '/admin/produtos/produtouser/'+$(this).val()+'.json',
			context: document.body,
			cache: false,
			success: function(data,ts,jqXHR){
				for (var i = 0; i < data.length; i++) {
					$o=$('<option>');
					$($o).attr('value', data[i].id);
					$($o).html(data[i].name);
					$("#producttest").append($o);

				};
			}});
		});  
		$( "#dialog-cadastro" ).dialog({
			autoOpen: false,
			height: 600,
			width: 850,
			modal: true,
			buttons: {
				"Cadastrar": function() {
						$.ajax({
							url: $("#new_contato").attr("action"),
							context: document.body,
							cache: false,
							data: $("#new_contato").serialize(),
							type: "POST",
							success: function(data,ts,jqXHR){
								// var el = "<tr data-id='"+data.id+"' class='data-row'><td>"+data.nome+"</td><td>"+data.telefone+"</td></tr>"
								// $("#table-cadastrados").append(el);
								addopcao(data, "#chosen_b");
								$( "#dialog-cadastro" ).dialog( "close" );   
							},
							error: function(jqXHR){
								mensagem = '';
								alert(jqXHR.responseText);
								data = eval('('+jqXHR.responseText+')');								
								if (data.name){
									for (var i=0; i<data.name.length; i++){
										mensagem += "NOME: "+data.name[i]+"\n";
									}
								}
								if (data.telefone){
									for (var i=0; i<data.telefone.length; i++){
										mensagem += "TELEFONE: "+data.telefone[i]+"\n";
									}
								}
								alert("Falha ao tentar gravar \n\n "+mensagem);
							}
						});
						// $("#new_contato").submit();
				},
				Cancelar: function() {
					$( this ).dialog( "close" );
				}
			},
			close: function() {
				allFields.val( "" ).removeClass( "ui-state-error" );
			}
		});			

    });



// jQuery ->
// 	$('#chamado_produto_name').autocomplete
// 		 source: $('#chamado_produto_name').data('autocomplete-source')

//  $(document).ready ->
//    $("#new_contato").attr "action", $("#new_contato").attr("action") + ".json"
//    $("#bt-cadastra").button().click ->
//      document.getElementById("new_contato").reset()
//      $("#dialog-cadastro").dialog "open"   clicaTR = ->
//      alert $(this).attr("data-id")

//    $.each $(".data-row"), ->
//      $(this).click clicaTR
//    $("#dialog-cadastro").dialog#     autoOpen: false
//      height: 300
//      width: 350
//      modal: true
//      buttons:
//        Cadastrar: ->
//          $.ajax
//            url: $("#new_contato").attr("action")
//            context: document.body
//            cache: false
//            data: $("#new_contato").serialize()
//            type: "POST"
//            success: (data, ts, jqXHR) ->
//              el = "<tr data-id='" + data.id + "' class='data-row'><td>" + data.nome + "</td><td>" + data.telefone + "</td></tr>"
//              $("#table-cadastrados").append el
//              $("#dialog-cadastro").dialog "close"

//            error: (jqXHR) ->
//              mensagem = ""
//              data = eval_("(" + jqXHR.responseText + ")")
//              if data.nome
//                i = 0
//                while i < data.nome.length
//                  mensagem += "NOME: " + data.nome[i] + "\n"
//                  i++
//              if data.telefone
//                i = 0
//                while i < data.telefone.length
//                  mensagem += "TELEFONE: " + data.telefone[i] + "\n"#                 i++
//              alert "Falha ao tentar gravar \n\n " + mensagem      
//                   $("#new_contato").submit();
//        Cancel: ->
//          $(this).dialog "close"#     close: ->
//        allFields.val("").removeClass "ui-state-error"
