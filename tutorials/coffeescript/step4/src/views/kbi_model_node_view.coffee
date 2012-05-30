kbi.ModelNodeView = """
<li class='kbi' data-bind="css: {opened: opened, closed: !opened()}">
  <div class='kbi model' data-bind="click: function(){ opened(!opened()); }">
    <span data-bind="text: (opened() ? '- ' : '+ ' )"></span>
    <span data-bind="text: name"></span>
  </div>

  <!-- ko if: opened -->
    <!-- ko foreach: attribute_names -->

      <!-- ko if: ($parent.attributeType($data) == 'simple') -->
        <fieldset class='kbi'>
          <label data-bind="text: $data"> </label>
          <input type='text' data-bind="value: $parent.node[$data]">
        </fieldset>
      <!-- /ko -->

      <!-- ko if: ($parent.attributeType($data) == 'model') -->
        <ul class='kbi' data-bind="template: {name: 'kbi_model_node', data: new kbi.NodeViewModel($data, false, $parent.node[$data])}"></ul>
      <!-- /ko -->

      <!-- ko if: ($parent.attributeType($data) == 'collection') -->
        <ul class='kbi' data-bind="template: {name: 'kbi_collection_node', data: new kbi.NodeViewModel($data+'[]', true, $parent.node[$data])}"></ul>
      <!-- /ko -->

    <!-- /ko -->
  <!-- /ko -->
</li>
"""