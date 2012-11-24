// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//










































































$(document).ready(function(){
	setTimeout(function(){
		$('.alert.alert-success, .alert.alert-error').slideUp('fast');
	}, 5000)

})
// js/jquery.min
// js/jquery.debouncedresize.min
// js/jquery.actual.min
// js/jquery.cookie.min

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).parents(".controls:first").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  content_rep = content.replace(regexp, new_id);
  $("#" + association).append( content_rep );
  add_mask_fields( "#" + association );
}

function add_mask_fields(parent){
   $(parent).find("input[mask='ddd']").mask("99",{placeholder:" "});
   $(parent).find("input[mask='numero']").mask("?999999999",{placeholder:" "});
   $(parent).find("input[mask='telefone']").mask("?999999999",{placeholder:" "});
   $(parent).find("input[mask='cep']").mask("99999-999",{placeholder:" "});
   $(parent).find("input[mask='cpf']").mask("999.999.999-99",{placeholder:" "});
   $(parent).find("input[mask='cnpj']").mask("99.999.999/9999-99",{placeholder:" "});
   $(parent).find("input[mask='valor']").maskMoney({symbol:"R$",decimal:".",thousands:""})
}

$(function(){
  add_mask_fields( window.document );
})


// jquery
// jquery-ui
// jquery_ujs
// jquery.pjax
// bootstrap/js/bootstrap.min
// lib/qtip2/jquery.qtip.min
// lib/jBreadcrumbs/js/jquery.jBreadCrumb.1.1.min
// lib/colorbox/jquery.colorbox.min
// js/ios-orientationchange-fix
// lib/antiscroll/antiscroll
// lib/antiscroll/jquery-mousewheel
// js/gebo_common
// js/jquery.imagesloaded.min
// js/jquery.wookmark
// select2



//= lib/jquery-ui/jquery-ui-1.8.20.custom.min
//= js/forms/jquery.ui.touch-punch.min



//* show all elements & remove preloader
setTimeout('$("html").removeClass("js")',1000);
