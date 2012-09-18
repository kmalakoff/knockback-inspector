class kbi.CollectionNodeViewGenerator
  constructor: (@template_name) ->
  viewText: ->
    return """
      #{@nodeStart()}
      #{@nodeManipulator()}
        <!-- ko if: opened -->
          <!-- ko foreach: node -->
            #{@modelNode()}
          <!-- /ko -->
        <!-- /ko -->
      #{@nodeEnd()}
      """

  nodeStart: ->
    return """<li class='kbi' data-bind="css: {opened: opened, closed: !opened()}">"""

  nodeManipulator: ->
    return """<div class='collection' data-bind="click: function(){ opened(!opened()) }">
      <span data-bind="text: (opened() ? '- ' : '+ ' )"></span>
      <span data-bind="text: name"></span>
    </div>"""

  modelNode: ->
    return """#{kbi.ViewHTML.modelTree("'['+$index()+']'", false, "$data")}"""

  nodeEnd: -> return '</li>'