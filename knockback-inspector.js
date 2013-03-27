/*
  knockback-inspector.js 0.1.6
  (c) 2011, 2012 Kevin Malakoff - http://kmalakoff.github.com/knockback/
  License: MIT (http://www.opensource.org/licenses/mit-license.php)
  Dependencies: Knockout.js, Backbone.js, and Underscore.js.
*/
(function() {
  return (function(factory) {
    // AMD
    if (typeof define === 'function' && define.amd) {
      return define('knockback-inspector', ['underscore', 'backbone', 'knockout', 'knockback'], factory);
    }
    // CommonJS/NodeJS or No Loader
    else {
      return factory.call(this);
    }
  })(function() {// Generated by CoffeeScript 1.6.2
/*
knockback-inspector.js 0.1.6
(c) 2012 Kevin Malakoff.
Knockback-Inspector.js is freely distributable under the MIT license.
See the following for full license details:
  https://github.com/kmalakoff/knockback-inspector/blob/master/LICENSE
Dependencies: Knockout.js, Underscore.js, Backbone.js, and Knockback.js.
*/

var Backbone, e, kb, kbi, ko, _, _ref, _ref1,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

if (!this._ && (typeof require !== 'undefined')) {
  try {
    _ = require('lodash');
  } catch (_error) {
    e = _error;
    _ = require('underscore');
  }
} else {
  _ = this._;
}

_ = _.hasOwnProperty('_') ? _._ : _;

Backbone = !this.Backbone && (typeof require !== 'undefined') ? require('backbone') : this.Backbone;

ko = !this.ko && (typeof require !== 'undefined') ? require('knockout') : this.ko;

kb = !this.kb && (typeof require !== 'undefined') ? require('knockback') : this.kb;

kbi = this.kbi = typeof exports !== 'undefined' ? exports : {};

this.kbi.VERSION = '0.1.6';

kbi.TemplateSource = (function() {
  function TemplateSource(template_generator, binding_context) {
    this.template_generator = template_generator;
    this.binding_context = binding_context != null ? binding_context : {};
  }

  TemplateSource.prototype.data = function(key, value) {
    if (arguments.length === 1) {
      return this.binding_context[key];
    }
    return this.binding_context[key] = value;
  };

  TemplateSource.prototype.text = function() {
    if (arguments.length > 0) {
      throw 'kbi.TemplateSource: unexpected writing to template source';
    }
    return this.template_generator.viewText(this.binding_context);
  };

  return TemplateSource;

})();

kbi.TemplateEngine = (function(_super) {
  __extends(TemplateEngine, _super);

  function TemplateEngine() {
    this.allowTemplateRewriting = false;
    this.generators = {
      kbi_array_node: kbi.ArrayNodeViewGenerator,
      kbi_model_node: kbi.ModelNodeViewGenerator,
      kbi_collection_node: kbi.CollectionNodeViewGenerator
    };
  }

  TemplateEngine.prototype.generator = function(template_name, generator_class) {
    if (arguments.length === 1) {
      return this.generators[template_name];
    }
    return this.generators[template_name] = generator_class;
  };

  TemplateEngine.prototype.makeTemplateSource = function(template_name) {
    if (this.generators.hasOwnProperty(template_name)) {
      return new kbi.TemplateSource(new this.generators[template_name](template_name));
    }
    return TemplateEngine.__super__.makeTemplateSource.apply(this, arguments);
  };

  TemplateEngine.prototype.renderTemplateSource = function(template_source, binding_context, options) {
    var key, value;

    for (key in binding_context) {
      value = binding_context[key];
      template_source.data(key, value);
    }
    return TemplateEngine.__super__.renderTemplateSource.apply(this, arguments);
  };

  return TemplateEngine;

})(ko.nativeTemplateEngine);

kbi.FetchedModel = (function(_super) {
  __extends(FetchedModel, _super);

  function FetchedModel() {
    _ref = FetchedModel.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  FetchedModel.prototype.parse = function(response) {
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
  };

  return FetchedModel;

})(Backbone.Model);

kbi.FetchedCollection = (function(_super) {
  __extends(FetchedCollection, _super);

  function FetchedCollection() {
    _ref1 = FetchedCollection.__super__.constructor.apply(this, arguments);
    return _ref1;
  }

  FetchedCollection.prototype.model = kbi.FetchedModel;

  FetchedCollection.prototype.parse = function(response) {
    var models;

    models = response.results ? response.results : response;
    return _.map(response.results, function(result) {
      var model;

      model = new kbi.FetchedModel();
      return model.set(model.parse(result));
    });
  };

  return FetchedCollection;

})(Backbone.Collection);

kbi.NodeViewModel = (function() {
  function NodeViewModel(name, opened, node) {
    var model, node_value;

    this.name = name;
    this.node = node;
    this.opened = ko.observable(opened);
    node_value = ko.utils.unwrapObservable(this.node);
    if (node_value instanceof kb.ViewModel) {
      this.node = node_value;
      model = kb.utils.wrappedModel(this.node);
      this.attribute_names = ko.observableArray(model ? _.keys(model.attributes) : []);
    } else if (kb.utils.hasCollectionSignature(node_value)) {
      this.node = kb.collectionObservable(node_value);
    } else if (kb.utils.hasModelSignature(node_value)) {
      this.node = kb.viewModel(node_value);
      this.attribute_names = ko.observableArray(_.keys(node_value.attributes));
    }
    return;
  }

  return NodeViewModel;

})();

kbi.nodeViewModel = kbi.nvm = function(name, opened, node) {
  return new kbi.NodeViewModel(name, opened, node);
};

kbi.ArrayNodeViewGenerator = (function() {
  function ArrayNodeViewGenerator(template_name) {
    this.template_name = template_name;
  }

  ArrayNodeViewGenerator.prototype.viewText = function() {
    return "" + (this.nodeStart()) + "\n" + (this.nodeManipulator()) + "\n  <!-- ko if: opened -->\n    <!-- ko foreach: node -->\n      <!-- ko if: (kb.utils.valueType($data) == kb.TYPE_SIMPLE) -->\n        " + (this.attributeEditor()) + "\n      <!-- /ko -->\n\n      <!-- ko if: (kb.utils.valueType($data) == kb.TYPE_ARRAY) -->\n        " + (this.arrayTree()) + "\n      <!-- /ko -->\n\n      <!-- ko if: (kb.utils.valueType($data) == kb.TYPE_MODEL) -->\n        " + (this.modelTree()) + "\n      <!-- /ko -->\n\n      <!-- ko if: (kb.utils.valueType($data) == kb.TYPE_COLLECTION) -->\n        " + (this.collectionTree()) + "\n      <!-- /ko -->\n\n    <!-- /ko -->\n  <!-- /ko -->\n" + (this.nodeEnd());
  };

  ArrayNodeViewGenerator.prototype.nodeStart = function() {
    return "<li class='kbi' data-bind=\"css: {opened: opened, closed: !opened()}\">";
  };

  ArrayNodeViewGenerator.prototype.nodeManipulator = function() {
    return "<div class='array' data-bind=\"click: function(){ opened(!opened()) }\">\n  <span data-bind=\"text: (opened() ? '- ' : '+ ' )\"></span>\n  <span data-bind=\"text: name + '[]'\"></span>\n</div>";
  };

  ArrayNodeViewGenerator.prototype.attributeEditor = function() {
    return "<fieldset class='kbi'>\n  <label data-bind=\"text: '['+$index()+']'\"></label>\n  <input type='text' data-bind=\"value: $data, valueUpdate: 'keyup'\">\n</fieldset>";
  };

  ArrayNodeViewGenerator.prototype.arrayTree = function() {
    return "" + (kbi.ViewHTML.arrayTree("'['+$index()+']'", false, "$data"));
  };

  ArrayNodeViewGenerator.prototype.modelTree = function() {
    return "" + (kbi.ViewHTML.modelTree("'['+$index()+']'", false, "$data"));
  };

  ArrayNodeViewGenerator.prototype.collectionTree = function() {
    return "" + (kbi.ViewHTML.collectionTree("'['+$index()+']'", false, "$data"));
  };

  ArrayNodeViewGenerator.prototype.nodeEnd = function() {
    return '';
  };

  return ArrayNodeViewGenerator;

})();

kbi.CollectionNodeViewGenerator = (function() {
  function CollectionNodeViewGenerator(template_name) {
    this.template_name = template_name;
  }

  CollectionNodeViewGenerator.prototype.viewText = function() {
    return "" + (this.nodeStart()) + "\n" + (this.nodeManipulator()) + "\n  <!-- ko if: opened -->\n    <!-- ko foreach: node -->\n      " + (this.modelNode()) + "\n    <!-- /ko -->\n  <!-- /ko -->\n" + (this.nodeEnd());
  };

  CollectionNodeViewGenerator.prototype.nodeStart = function() {
    return "<li class='kbi' data-bind=\"css: {opened: opened, closed: !opened()}\">";
  };

  CollectionNodeViewGenerator.prototype.nodeManipulator = function() {
    return "<div class='collection' data-bind=\"click: function(){ opened(!opened()) }\">\n  <span data-bind=\"text: (opened() ? '- ' : '+ ' )\"></span>\n  <span data-bind=\"text: name\"></span>\n</div>";
  };

  CollectionNodeViewGenerator.prototype.modelNode = function() {
    return "" + (kbi.ViewHTML.modelTree("'['+$index()+']'", false, "$data"));
  };

  CollectionNodeViewGenerator.prototype.nodeEnd = function() {
    return '</li>';
  };

  return CollectionNodeViewGenerator;

})();

kbi.ModelNodeViewGenerator = (function() {
  function ModelNodeViewGenerator(template_name) {
    this.template_name = template_name;
  }

  ModelNodeViewGenerator.prototype.viewText = function() {
    return "" + (this.nodeStart()) + "\n" + (this.nodeManipulator()) + "\n  <!-- ko if: opened -->\n    <!-- ko foreach: attribute_names -->\n      <!-- ko if: (kb.utils.valueType($parent.node[$data]) == kb.TYPE_SIMPLE) -->\n        " + (this.attributeEditor()) + "\n      <!-- /ko -->\n\n      <!-- ko if: (kb.utils.valueType($parent.node[$data]) == kb.TYPE_ARRAY) -->\n        " + (this.arrayTree()) + "\n      <!-- /ko -->\n\n      <!-- ko if: (kb.utils.valueType($parent.node[$data]) == kb.TYPE_MODEL) -->\n        " + (this.modelTree()) + "\n      <!-- /ko -->\n\n      <!-- ko if: (kb.utils.valueType($parent.node[$data]) == kb.TYPE_COLLECTION) -->\n        " + (this.collectionTree()) + "\n      <!-- /ko -->\n\n    <!-- /ko -->\n  <!-- /ko -->\n" + (this.nodeEnd());
  };

  ModelNodeViewGenerator.prototype.nodeStart = function() {
    return "<li class='kbi' data-bind=\"css: {opened: opened, closed: !opened()}\">";
  };

  ModelNodeViewGenerator.prototype.nodeManipulator = function() {
    return "<div class='collection' data-bind=\"click: function(){ opened(!opened()) }\">\n  <span data-bind=\"text: (opened() ? '- ' : '+ ' )\"></span>\n  <span data-bind=\"text: name\"></span>\n</div>";
  };

  ModelNodeViewGenerator.prototype.attributeEditor = function() {
    return "<fieldset class='kbi'>\n  <label data-bind=\"text: $data\"></label>\n  <input type='text' data-bind=\"value: $parent.node[$data], valueUpdate: 'keyup'\">\n</fieldset>";
  };

  ModelNodeViewGenerator.prototype.arrayTree = function() {
    return "" + (kbi.ViewHTML.arrayTree('$data', false, "$parent.node[$data]"));
  };

  ModelNodeViewGenerator.prototype.modelTree = function() {
    return "" + (kbi.ViewHTML.modelTree('$data', false, "$parent.node[$data]"));
  };

  ModelNodeViewGenerator.prototype.collectionTree = function() {
    return "" + (kbi.ViewHTML.collectionTree("$data+'[]'", true, "$parent.node[$data]"));
  };

  ModelNodeViewGenerator.prototype.nodeEnd = function() {
    return '</li>';
  };

  return ModelNodeViewGenerator;

})();

kbi.ViewHTML = (function() {
  function ViewHTML() {}

  ViewHTML.arrayTree = function(name, opened, node) {
    return "<ul class='kbi' data-bind=\"template: {name: 'kbi_array_node', data: kbi.nvm(" + name + ", " + opened + ", " + node + ")}\"></ul>";
  };

  ViewHTML.modelTree = function(name, opened, node) {
    return "<ul class='kbi' data-bind=\"template: {name: 'kbi_model_node', data: kbi.nvm(" + name + ", " + opened + ", " + node + ")}\"></ul>";
  };

  ViewHTML.collectionTree = function(name, opened, node) {
    return "<ul class='kbi' data-bind=\"template: {name: 'kbi_collection_node', data: kbi.nvm(" + name + ", " + opened + ", " + node + ")}\"></ul>";
  };

  return ViewHTML;

})();
; return kbi;});
}).call(this);