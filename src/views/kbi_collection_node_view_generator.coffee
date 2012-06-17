class kbi.CollectionNodeViewGenerator
  constructor: (@template_name) ->
  viewText: (binding_context) ->
    return """
      #{@nodeStart(binding_context)}
      #{@nodeManipulator(binding_context)}
        <!-- ko if: opened -->
          <!-- ko foreach: node -->
            #{@modelNode(binding_context)}
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

  modelNode: (binding_context) ->
    return """#{kbi.ViewHTML.modelTree("'['+$index()+']'", false, "$data")}"""

  nodeEnd: (binding_context) ->
    return """</li>"""