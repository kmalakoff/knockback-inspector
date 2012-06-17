# template source
class kbi.TemplateSource
  constructor: (@template_string) ->
  text: (value) -> return @template_string

# template engine
class kbi.TemplateEngine extends ko.nativeTemplateEngine
  constructor: ->
    @allowTemplateRewriting = false

  makeTemplateSource: (template) ->
    switch (template)
      when 'kbi_model_node' then return new kbi.TemplateSource(kbi.ModelNodeView)
      when 'kbi_collection_node' then return new kbi.TemplateSource(kbi.CollectionNodeView)
      else return ko.nativeTemplateEngine.prototype.makeTemplateSource.apply(this, arguments)