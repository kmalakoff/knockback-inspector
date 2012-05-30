// General-purpose model for fetched JSON when you do not have a specialized implementation
kbi.FetchedModel = Backbone.Model.extend({
  parse: function(response) {
    var attributes, collection, key, model, value;
    attributes = {};
    for (key in response) {
      value = response[key];
      if (_.isObject(value)) {
        model = new kbi.FetchedModel();
        attributes[key] = model.set(model.parse(value));
      } else if (_.isArray(value)) {
        collection = new kbi.FetchedCollection();
        attributes[key] = collection.reset(collection.parse(value));
      } else {
        attributes[key] = value;
      }
    }
    return attributes;
  }
});

// General-purpose collection for fetched JSON when you do not have a specialized implementation
kbi.FetchedCollection = Backbone.Collection.extend({
  model: kbi.FetchedModel,
  parse: function(response) {
    return _.map(response.results, function(result) {
      var model = new kbi.FetchedModel();
      return model.set(model.parse(result));
    });
  }
});
