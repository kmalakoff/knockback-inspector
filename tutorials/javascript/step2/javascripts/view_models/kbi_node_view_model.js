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

// factory
kbi.nodeViewModel = kbi.nvm = function(name, opened, node) { return new kbi.NodeViewModel(name, opened, node); };