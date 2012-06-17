class kbi.ModelNodeViewGenerator
  constructor: (@template_name) ->
  viewText: (binding_context) ->
    return """
      #{@nodeStart(binding_context)}
      #{@nodeManipulator(binding_context)}
        <!-- ko if: opened -->
          <!-- ko foreach: attribute_names -->
            <!-- ko if: ($parent.attributeType($data) == 'simple') -->
              #{@attributeEditor(binding_context)}
            <!-- /ko -->

            <!-- ko if: ($parent.attributeType($data) == 'model') -->
              #{@modelTree(binding_context)}
            <!-- /ko -->

            <!-- ko if: ($parent.attributeType($data) == 'collection') -->
              #{@modelTree(binding_context)}
            <!-- /ko -->

          <!-- /ko -->
        <!-- /ko -->
      #{@nodeEnd(binding_context)}
      """

  nodeStart: (binding_context) ->
    return """<li class='kbi' data-bind="css: {opened: opened, closed: !opened()}">"""

  nodeManipulator: (binding_context) ->
    return """<div class='collection' data-bind="click: function(){ opened(!opened()) }">
      <span data-bind="text: (opened() ? '- ' : '+ ' )"></span>
      <span data-bind="text: name"></span>
    </div>"""

  attributeEditor: (binding_context) ->
    return """<fieldset class='kbi'>
      <label data-bind="text: $data"></label>
      <input type='text' data-bind="value: $parent.node[$data]">
    </fieldset>"""

  modelTree: (binding_context) ->
    return """#{kbi.ViewHTML.modelTree('$data', false, "$parent.node[$data]")}"""

  collectionTree: (binding_context) ->
    return """#{kbi.ViewHTML.collectionTree("$data+'[]'", true, "$parent.node[$data]")}"""

  nodeEnd: (binding_context) ->
    return """</li>"""