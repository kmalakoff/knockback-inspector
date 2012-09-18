class kbi.ArrayNodeViewGenerator
  constructor: (@template_name) ->
  viewText: ->
    return """
      #{@nodeStart()}
      #{@nodeManipulator()}
        <!-- ko if: opened -->
          <!-- ko foreach: node -->
            <!-- ko if: (kb.utils.valueType($data) == kb.TYPE_SIMPLE) -->
              #{@attributeEditor()}
            <!-- /ko -->

            <!-- ko if: (kb.utils.valueType($data) == kb.TYPE_ARRAY) -->
              #{@arrayTree()}
            <!-- /ko -->

            <!-- ko if: (kb.utils.valueType($data) == kb.TYPE_MODEL) -->
              #{@modelTree()}
            <!-- /ko -->

            <!-- ko if: (kb.utils.valueType($data) == kb.TYPE_COLLECTION) -->
              #{@collectionTree()}
            <!-- /ko -->

          <!-- /ko -->
        <!-- /ko -->
      #{@nodeEnd()}
      """

  nodeStart: ->
    return """<li class='kbi' data-bind="css: {opened: opened, closed: !opened()}">"""

  nodeManipulator: ->
    return """<div class='array' data-bind="click: function(){ opened(!opened()) }">
      <span data-bind="text: (opened() ? '- ' : '+ ' )"></span>
      <span data-bind="text: name"></span>
    </div>"""

  attributeEditor: ->
    return """
      <fieldset class='kbi'>
        <label data-bind="text: '['+$index()+']'"></label>
        <input type='text' data-bind="value: $data, valueUpdate: 'keyup'">
      </fieldset>
    """

  arrayTree: ->
    return """#{kbi.ViewHTML.arrayTree("'['+$index()+'] (array)'", false, "$data")}"""

  modelTree: ->
    return """#{kbi.ViewHTML.modelTree("'['+$index()+'] (model)'", false, "$data")}"""

  collectionTree: ->
    return """#{kbi.ViewHTML.collectionTree("'['+$index()+'] (collection)'", false, "$data")}"""

  nodeEnd: -> return ''