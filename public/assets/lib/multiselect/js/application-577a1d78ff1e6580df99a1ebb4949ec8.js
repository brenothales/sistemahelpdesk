(function(e){e(function(){e(".multiselect").multiSelect({}),e("#ms-optgroup .ms-selectable, #ms-outsideCountries .ms-selectable").find("li.ms-elem-selectable").hide(),e(".ms-optgroup-label").click(function(){e(this).hasClass("ms-collapse")?(e(this).nextAll("li").hide(),e(this).removeClass("ms-collapse")):(e(this).nextAll("li:not(.ms-selected)").show(),e(this).addClass("ms-collapse"))}),e("#searchable-form").multiSelect({selectableHeader:'<input type="text" id="search" autocomplete = "off" />'}),e("input#search").quicksearch("#ms-searchable-form .ms-selectable li"),e("#searchable-form").multiSelect(),e("#multipleHeaders").multiSelect({selectableHeader:"<h4>Selectable Items</h4>",selectedHeader:"<h4>Selected Items</h4>"}),e("#simpleCountries").multiSelect({}),e("#ikeeporder").multiSelect({keepOrder:!0}),e("#empty-array-select").multiSelect({emptyArray:!0}),e("#callbackCountries").multiSelect({afterSelect:function(e,t){alert("Select element\nvalue: "+e+"\ntext: "+t)},afterDeselect:function(e,t){alert("Deselect element\nvalue: "+e+"\ntext: "+t)}}),e("#selectAll").click(function(){return e("#outsideCountries").multiSelect("select_all"),!1}),e("#deselectAll").click(function(){return e("#outsideCountries").multiSelect("deselect_all"),!1}),e("#selectFR").click(function(){return e("#outsideCountries").multiSelect("select","fr"),!1}),e("#deselectFR").click(function(){return e("#outsideCountries").multiSelect("deselect","fr"),!1}),e("#demos-menu li").click(function(){e("#demos-menu li").removeClass("active"),e("#demos-content").children("div").hide(),e(this).addClass("active"),e("#demos-content ."+e(this).attr("id")).show()}),e("#real-form").submit(function(){var t=e("#real-form").find("select").val(),n=t?"["+t+"]":t;return alert("select value:\n"+n),!1}),e("#empty-array-form").submit(function(){var t=e("#empty-array-form").find("select").val(),n=t?"["+t+"]":t;return alert("select value:\n"+n),!1})})})(jQuery);