class kbi.NodeViewModel
  constructor: (@name, opened, node) ->
    @opened = ko.observable(opened)
    @node = ko.utils.unwrapObservable(node)

    # a kb.ViewModel indicates the node is a Backbone.Model
    if (@node instanceof kb.ViewModel)
      model = kb.utils.wrappedModel(@node)
      @attribute_names = ko.observableArray(if model then _.keys(model.attributes) else [])
    return

# factory
kbi.nodeViewModel = kbi.nvm = (name, opened, node) -> return new kbi.NodeViewModel(name, opened, node)