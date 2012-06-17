// template source
kbi.TemplateSource = function(template_string) { this.template_string = template_string; };
kbi.TemplateSource.prototype.text = function(value) { return this.template_string; };

// template engine
kbi.TemplateEngine = function() { this.allowTemplateRewriting = false; };
kbi.TemplateEngine.prototype = new ko.nativeTemplateEngine();
kbi.TemplateEngine.prototype.makeTemplateSource = function(template) {
  switch (template) {
    case 'kbi_model_node':
      return new kbi.TemplateSource(kbi.ModelNodeView);
    case 'kbi_collection_node':
      return new kbi.TemplateSource(kbi.CollectionNodeView);
    default:
      return ko.nativeTemplateEngine.prototype.makeTemplateSource.apply(this, arguments);
  }
};
