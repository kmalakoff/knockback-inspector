# template source
class kbi.StringTemplateSource
  constructor: (@template_string) ->
  text: (value) -> return @template_string

# template engine
class kbi.StringTemplateEngine extends ko.nativeTemplateEngine
  constructor: ->
    @allowTemplateRewriting = false

  makeTemplateSource: (template) ->
    switch (template)
      when 'kbi_model_node' then return new kbi.StringTemplateSource(kbi.ModelNodeView)
      when 'kbi_collection_node' then return new kbi.StringTemplateSource(kbi.CollectionNodeView)
      else return ko.nativeTemplateEngine.prototype.makeTemplateSource.apply(this, arguments)