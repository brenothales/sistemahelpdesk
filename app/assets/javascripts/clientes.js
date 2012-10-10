$(function(){
  $("#cliente_tipo_cliente_id").change(function(){
    $("#cpf_field, #cnpj_field").hide();
    if( $(this).val() == 1 ){
      $("#cpf_field").show();
    }else{
      $("#cnpj_field").show();
    }

  }).trigger("change");
});


$(document).ready(function() {
  return $("#e2").select2();
});


$('input#picker').daterangepicker();