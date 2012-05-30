// Generated by CoffeeScript 1.3.3
(function() {

  kbi.ModelNodeView = "<li class='kbi' data-bind=\"css: {opened: opened, closed: !opened()}\">\n  <div class='kbi model' data-bind=\"click: function(){ opened(!opened()); }\">\n    <span data-bind=\"text: (opened() ? '- ' : '+ ' )\"></span>\n    <span data-bind=\"text: name\"></span>\n  </div>\n\n  <!-- ko if: opened -->\n    <!-- ko foreach: attribute_names -->\n\n      <!-- ko if: ($parent.attributeType($data) == 'simple') -->\n        <fieldset class='kbi'>\n          <label data-bind=\"text: $data\"> </label>\n          <input type='text' data-bind=\"value: $parent.node[$data]\">\n        </fieldset>\n      <!-- /ko -->\n\n      <!-- ko if: ($parent.attributeType($data) == 'model') -->\n        <ul class='kbi' data-bind=\"template: {name: 'kbi_model_node', data: new kbi.NodeViewModel($data, false, $parent.node[$data])}\"></ul>\n      <!-- /ko -->\n\n      <!-- ko if: ($parent.attributeType($data) == 'collection') -->\n        <ul class='kbi' data-bind=\"template: {name: 'kbi_collection_node', data: new kbi.NodeViewModel($data+'[]', true, $parent.node[$data])}\"></ul>\n      <!-- /ko -->\n\n    <!-- /ko -->\n  <!-- /ko -->\n</li>";

}).call(this);
