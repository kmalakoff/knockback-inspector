class kbi.NodeViewModel
  constructor: (name, opened, node) ->
    @name = name
    @opened = ko.observable(opened)
    @node = ko.utils.unwrapObservable(node)

    # a kb.ViewModel indicates the node is a Backbone.Model
    if (@node instanceof kb.ViewModel)
      model = kb.utils.wrappedModel(@node)
      @attribute_names = ko.observableArray(if model then _.keys(model.attributes) else [])
    @

  attributeType: (key) ->
    attribute_connector = @node[key]
    return 'model' if (ko.utils.unwrapObservable(attribute_connector) instanceof kb.ViewModel)
    return 'collection' if kb.utils.observableInstanceOf(attribute_connector, kb.CollectionAttributeConnector)
    return 'simple'
