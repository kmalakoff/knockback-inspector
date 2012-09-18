class kbi.NodeViewModel
  constructor: (@name, opened, @node) ->
    @opened = ko.observable(opened)

    # a kb.ViewModel indicates the node is a Backbone.Model
    node_value = ko.utils.unwrapObservable(@node)
    if (node_value instanceof kb.ViewModel)
      @node = node_value # store unwrapped view model
      model = kb.utils.wrappedModel(@node)
      @attribute_names = ko.observableArray(if model then _.keys(model.attributes) else [])

    # Backbone signature
    else if (typeof(node_value.get) is 'function') and (typeof(node_value.trigger) is 'function')
      # Backbone.Collection signature
      if (node_value.models)
        @node = kb.collectionObservable(node_value) # create collection observable
      # Backbone.Model signature
      else
        @node = kb.viewModel(node_value) # create view model
        @attribute_names = ko.observableArray(_.keys(node_value.attributes))

    return

# factory
kbi.nodeViewModel = kbi.nvm = (name, opened, node) -> return new kbi.NodeViewModel(name, opened, node)