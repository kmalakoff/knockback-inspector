$(document).ready( ->
  module("knockback-inspector")

  # import Underscore (or Lo-Dash with precedence), Backbone, Knockout, and Knockback
  Backbone = if not window.Backbone and (typeof(require) != 'undefined') then require('backbone') else window.Backbone
  ko = if not window.ko and (typeof(require) != 'undefined') then require('knockout') else window.ko
  kb = if not window.kb and (typeof(require) != 'undefined') then require('knockback') else window.kb
  kbi = if not window.kbi and (typeof(require) != 'undefined') then require('knockback-inspector') else window.kbi

  test("TEST DEPENDENCY MISSING", ->
    ok(!!Backbone); ok(!!ko); ok(!!kb); ok(!!kbi)
  )

  # make kbi global so can be accessed by templates
  window.kbi = kbi

  # set the template engine so Knockout can find 'kbi_model_node' and 'kbi_collection_node' templates
  ko.setTemplateEngine(new kbi.TemplateEngine())

  test("Backbone.Model", ->
    html = """
      <ul id='model' data-bind="template: {name: 'kbi_model_node', data: kbi.nvm('root', true, $data)}"></ul>
    """

    your_model = new Backbone.Model({name: 'Hello', place: 'World!'})
    ko.applyBindings(kb.viewModel(your_model), $(html)[0])
  )

  test("Backbone.Collection", ->
    html = """
      <ul id='collection' data-bind="template: {name: 'kbi_collection_node', data: kbi.nvm('root', true, $data)}"></ul>
    """

    your_collection = new Backbone.Collection([{name: 'Hello', place: 'World!'}, {name: 'Goodbye', place: 'Samsara!'}])
    ko.applyBindings(kb.collectionObservable(your_collection, {view_model: kb.ViewModel}), $(html)[0]);
  )
)