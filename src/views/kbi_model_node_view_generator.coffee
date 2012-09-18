class kbi.ModelNodeViewGenerator
  constructor: (@template_name) ->
  viewText: ->
    return """
      #{@nodeStart()}
      #{@nodeManipulator()}
        <!-- ko if: opened -->
          <!-- ko foreach: attribute_names -->
            <!-- ko if: (kb.utils.valueType($parent.node[$data]) == kb.TYPE_SIMPLE) -->
              #{@attributeEditor()}
            <!-- /ko -->

            <!-- ko if: (kb.utils.valueType($parent.node[$data]) == kb.TYPE_ARRAY) -->
              #{@arrayTree()}
            <!-- /ko -->

            <!-- ko if: (kb.utils.valueType($parent.node[$data]) == kb.TYPE_MODEL) -->
              #{@modelTree()}
            <!-- /ko -->

            <!-- ko if: (kb.utils.valueType($parent.node[$data]) == kb.TYPE_COLLECTION) -->
              #{@collectionTree()}
            <!-- /ko -->

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

  attributeEditor: ->
    return """
    <fieldset class='kbi'>
      <label data-bind="text: $data"></label>
      <input type='text' data-bind="value: $parent.node[$data], valueUpdate: 'keyup'">
    </fieldset>
    """

  arrayTree: ->
    return """#{kbi.ViewHTML.arrayTree('$data', false, "$parent.node[$data]")}"""

  modelTree: ->
    return """#{kbi.ViewHTML.modelTree('$data', false, "$parent.node[$data]")}"""

  collectionTree: ->
    return """#{kbi.ViewHTML.collectionTree("$data+'[]'", true, "$parent.node[$data]")}"""

  nodeEnd: -> return '</li>'