class kbi.NodeViewModel
  constructor: (@name, opened, @node) ->
    @opened = ko.observable(opened)

    # a kb.ViewModel indicates the node is a Backbone.Model
    if (ko.utils.unwrapObservable(@node) instanceof kb.ViewModel)
      @node = ko.utils.unwrapObservable(@node) # store unwrapped view model
      model = kb.utils.wrappedModel(@node)
      @attribute_names = ko.observableArray(if model then _.keys(model.attributes) else [])
    @

# factory
kbi.nodeViewModel = kbi.nvm = (name, opened, node) -> return new kbi.NodeViewModel(name, opened, node)