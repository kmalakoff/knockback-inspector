// template source
kbi.StringTemplateSource = function(template_string) { this.template_string = template_string; };
kbi.StringTemplateSource.prototype.text = function(value) { return this.template_string; };

// template engine
kbi.StringTemplateEngine = function() { this.allowTemplateRewriting = false; };
kbi.StringTemplateEngine.prototype = new ko.nativeTemplateEngine();
kbi.StringTemplateEngine.prototype.makeTemplateSource = function(template) {
  switch (template) {
    case 'kbi_model_node':
      return new kbi.StringTemplateSource(kbi.ModelNodeView);
    case 'kbi_collection_node':
      return new kbi.StringTemplateSource(kbi.CollectionNodeView);
    default:
      return ko.nativeTemplateEngine.prototype.makeTemplateSource.apply(this, arguments);
  }
};
