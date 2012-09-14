$(document).ready( ->
  module("knockback-defaults-amd.js")

  # Knockback and depdenencies
  require(['underscore', 'backbone', 'knockout', 'knockback', 'knockback-inspector'], (_, Backbone, ko, kb, kbi) ->
    Backbone or (Backbone = kb.Backbone)

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
)