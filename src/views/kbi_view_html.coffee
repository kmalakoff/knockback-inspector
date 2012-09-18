class kbi.ViewHTML
  @arrayTree: (name, opened, node) ->
    return """<ul class='kbi' data-bind="template: {name: 'kbi_array_node', data: kbi.nvm(#{name}, #{opened}, #{node})}"></ul>"""

  @modelTree: (name, opened, node) ->
    return """<ul class='kbi' data-bind="template: {name: 'kbi_model_node', data: kbi.nvm(#{name}, #{opened}, #{node})}"></ul>"""

  @collectionTree: (name, opened, node) ->
    return """<ul class='kbi' data-bind="template: {name: 'kbi_collection_node', data: kbi.nvm(#{name}, #{opened}, #{node})}"></ul>"""
