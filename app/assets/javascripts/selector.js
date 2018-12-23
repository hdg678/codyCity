function deselect(elements) {
  for (var i = 0; i < elements.length; ++i) {
    $("#" + elements[i]).removeClass("selector-option-selected");
  }
}

function select(option) {
  $(option).addClass("selector-option-selected");
}

function selectorFor(handler, options) {
  elements = options.map(function(item, index) { return item.id });
  for (var i = 0; i < options.length; ++i) {
    option = options[i];
    $("#" + option.id).click(function(event) {
      deselect(elements);
      select(event.currentTarget);
      handler(options.find(function(option) { return option.id == event.currentTarget.id; }));
    });
  }
}
