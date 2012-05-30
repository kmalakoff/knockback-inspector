// Generated by CoffeeScript 1.3.3
(function() {

  kbi.NodeViewModel = (function() {

    function NodeViewModel(name, opened, node) {
      var model;
      this.name = name;
      this.opened = ko.observable(opened);
      this.node = ko.utils.unwrapObservable(node);
      if (this.node instanceof kb.ViewModel) {
        model = kb.utils.wrappedModel(this.node);
        this.attribute_names = ko.observableArray(model ? _.keys(model.attributes) : []);
      }
      this;

    }

    NodeViewModel.prototype.attributeType = function(key) {
      var attribute_connector;
      attribute_connector = this.node[key];
      if (ko.utils.unwrapObservable(attribute_connector) instanceof kb.ViewModel) {
        return 'model';
      }
      if (kb.utils.observableInstanceOf(attribute_connector, kb.CollectionAttributeConnector)) {
        return 'collection';
      }
      return 'simple';
    };

    return NodeViewModel;

  })();

}).call(this);
