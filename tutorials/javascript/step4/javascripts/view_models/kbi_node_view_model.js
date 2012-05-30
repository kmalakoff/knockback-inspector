kbi.NodeViewModel = function(name, opened, node) {
  this.name = name;
  this.opened = ko.observable(opened);
  this.node = ko.utils.unwrapObservable(node);

  // a kb.ViewModel indicates the node is a Backbone.Model
  if (this.node instanceof kb.ViewModel) {
    var model = kb.utils.wrappedModel(this.node);
    this.attribute_names = ko.observableArray(model ? _.keys(model.attributes) : []);
  }
};

kbi.NodeViewModel.prototype.attributeType = function(key) {
  var attribute_connector = this.node[key];
  if (ko.utils.unwrapObservable(attribute_connector) instanceof kb.ViewModel)
    return 'model';
  else if (kb.utils.observableInstanceOf(attribute_connector, kb.CollectionAttributeConnector))
    return 'collection';
  else
    return 'simple';
};
