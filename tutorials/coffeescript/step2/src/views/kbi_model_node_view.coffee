kbi.ModelNodeView = """
<li class='kbi' data-bind="css: {opened: opened, closed: !opened()}">
  <div class='kbi model' data-bind="click: function(){ opened(!opened()); }">
    <span data-bind="text: (opened() ? '- ' : '+ ' )"></span>
    <span data-bind="text: name"></span>
  </div>

  <!-- ko if: opened -->
    <!-- ko foreach: attribute_names -->

      <!-- ko if: (kb.utils.valueType($parent.node[$data]) < kb.TYPE_MODEL) -->
        <fieldset class='kbi'>
          <label data-bind="text: $data"> </label>
          <input type='text' data-bind="value: $parent.node[$data]">
        </fieldset>
      <!-- /ko -->

      <!-- ko if: (kb.utils.valueType($parent.node[$data]) == kb.TYPE_MODEL) -->
        <ul class='kbi' data-bind="template: {name: 'kbi_model_node', data: kbi.nvm($data, false, $parent.node[$data])}"></ul>
      <!-- /ko -->

      <!-- ko if: (kb.utils.valueType($parent.node[$data]) == kb.TYPE_COLLECTION) -->
        <ul class='kbi' data-bind="template: {name: 'kbi_collection_node', data: kbi.nvm($data+'[]', true, $parent.node[$data])}"></ul>
      <!-- /ko -->

    <!-- /ko -->
  <!-- /ko -->
</li>
"""