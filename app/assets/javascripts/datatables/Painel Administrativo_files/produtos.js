(function() {

  jQuery(function() {
    return $('#produto_produto_name').autocomplete({
      source: $('#produto_produto_name').data('autocomplete-source')
    });
  });

}).call(this);
