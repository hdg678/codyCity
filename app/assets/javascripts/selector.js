function deselect(elements) {
  for (var i = 0; i < elements.length; ++i) {
    $("#" + elements[i]).removeClass("selector-option-selected");
  }
}

function select(option) {
  $(option).addClass("selector-option-selected");
}

function selectorFor(handler, options) {
  var elements = options.map(function(item, index) { return item.id; });
  for (var i = 0; i < options.length; ++i) {
    option = options[i];
    $("#" + option.id).click(function(event) {
      deselect(elements);
      select(event.currentTarget);
      handler(options.find(function(option) { return option.id == event.currentTarget.id; }));
    });
  }
  $("#" + options[0].id).trigger("click");
}

function horizontalSelector(options, params) {
  handler = function(option) {
    params.form_element.attr("action", option.form.action);
    for (var i = 0; i < params.form_inputs.length; ++i) {
      input = params.form_inputs[i];
      $("#" + input.id).attr("name", option.attribute + "[" + input.name + "]");
    }

    if ($("#" + option.id).index() == 0) {
      params.bottom_element.addClass(params.first_selected);
    } else {
      params.bottom_element.removeClass(params.first_selected);
    }
  }

  selectorFor(handler, options);
}

function horizontalSelectorShowHide(options, params) {
  handler = function(option) {
    var elements = options.map(function(item, index) { return item.element; });
    for (var i = 0; i < elements.length; ++i) {
      $(elements[i]).hide();
    }

    $(option.element).show();

    if ($("#" + option.id).index() == 0) {
      params.bottom_element.addClass(params.first_selected);
    } else {
      params.bottom_element.removeClass(params.first_selected);
    }
  }

  selectorFor(handler, options);
}
