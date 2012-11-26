//= require compromissos
//= require raphael
//= require morris







jQuery.fn.submitOnCheck2 = function() {
  this.find('input[type=submit]').remove();
  this.find('input[type=checkbox]').click(function() {
    $(this).parent('form').submit();
  });
  return this;
}

$(function() {
  $('.edit_compromisso').submitOnCheck2();
});



// CoffeeScript Version:
// 
// jQuery.fn.submitOnCheck2 = ->
//   @find('input[type=submit]').remove()
//   @find('input[type=checkbox]').click ->
//     $(this).parent('form').submit()
//   this
// 
// jQuery ->
//   $('.edit_task').submitOnCheck2()
