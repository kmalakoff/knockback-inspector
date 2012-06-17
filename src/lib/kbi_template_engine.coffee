# template source
class kbi.TemplateSource
  constructor: (@template_generator, @binding_context={}) ->

  data: (key, value) ->
    return @binding_context[key] if arguments.length is 1
    @binding_context[key] = value

  text: ->
    throw 'kbi.TemplateSource: unexpected writing to template source' if (arguments.length > 0)
    return @template_generator.viewText(@binding_context)

# template engine
class kbi.TemplateEngine extends ko.nativeTemplateEngine
  constructor: ->
    @allowTemplateRewriting = false
    @generators =
      kbi_model_node: kbi.ModelNodeViewGenerator
      kbi_collection_node: kbi.CollectionNodeViewGenerator

  generator: (template_name, generator_class) ->
    return @generators[template_name] if arguments.length is 1
    @generators[template_name] = generator_class

  makeTemplateSource: (template_name) ->
    return new kbi.TemplateSource(new @generators[template_name](template_name)) if @generators.hasOwnProperty(template_name)
    return super

  renderTemplateSource: (template_source, binding_context, options) ->
    template_source.data(key, value) for key, value of binding_context
    return super
