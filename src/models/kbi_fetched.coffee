# General-purpose model for fetched JSON when you do not have a specialized implementation
class kbi.FetchedModel extends Backbone.Model
  parse: (response) ->
    attributes = {}
    for key, value of response
      if _.isObject(value)
        model = new kbi.FetchedModel()
        attributes[key] = model.set(model.parse(value))
      else if _.isArray(value)
        collection = new kbi.FetchedCollection()
        attributes[key] = collection.reset(collection.parse(value))
      else
        attributes[key] = value
    return attributes

# General-purpose collection for fetched JSON when you do not have a specialized implementation
class kbi.FetchedCollection extends Backbone.Collection
  model: kbi.FetchedModel
  parse: (response) ->
    models = if response.results then response.results else response
    return _.map(response.results, (result) ->
      model = new kbi.FetchedModel()
      return model.set(model.parse(result))
    )