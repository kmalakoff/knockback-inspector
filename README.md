[![Build Status](https://secure.travis-ci.org/kmalakoff/knockback-inspector.png)](http://travis-ci.org/kmalakoff/knockback-inspector)

![logo](https://github.com/kmalakoff/knockback-inspector/raw/master/media/logo.png)

Knockback-Inspector.js provides an inspector tree view library for Backbone.Models and Backbone.Collections using Knockback.js,

#Download Latest (0.1.5):

* [Development version](https://raw.github.com/kmalakoff/knockback-inspector/0.1.5/knockback-inspector.js)
* [Production version](https://raw.github.com/kmalakoff/knockback-inspector/0.1.5/knockback-inspector.min.js)
* [Styling](http://cloud.github.com/downloads/kmalakoff/knockback-inspector/knockback-inspector.css)

Please see the [release notes](https://github.com/kmalakoff/knockback-inspector/blob/master/RELEASE_NOTES.md) for upgrade pointers.

###Module Loading

Knockback-Inspector.js is compatible with Require.js and AMD module loading. Module names:

* 'knockback-inspector' - knockback-inspector.js.

### Dependencies

* [Knockback.js](http://kmalakoff.github.com/knockback/)
* [Knockout.js](https://github.com/SteveSanderson/knockout/downloads/)
* [Backbone.js](http://documentcloud.github.com/backbone/)
* [Underscore.js](http://documentcloud.github.com/underscore/)


For a step-by-step guide to creating and using Knockback-Inspector, please take a look at the [full tutorial](http://kmalakoff.github.com/knockback/tutorial_knockback_inspector.html
).

For more information on Knockback.js, please look at the website: http://kmalakoff.github.com/knockback/

The Knockout-Inspector is designed as a small standalone library that you can integrate into your own application for debugging purposes. Just include the library file and optional styling into your HTML file:

```
<script src='knockback-inspector.min.js'></script>
<link rel='stylesheet' href='knockback-inspector.css'>
```

If you want to inspect a model, set up the bindings like:

````
  <ul id='model' data-bind="template: {name: 'kbi_model_node', data: kbi.nvm('root', true, $data)}"></ul>
  <script type='text/javascript'>
    var your_model = new Backbone.Model({name: 'Hello', place: 'World!'});
    ko.applyBindings(kb.viewModel(your_model), $('#model')[0]);
  </script>
````

If you want to inspect a collection, set up the bindings like:

````
  <ul id='collection' data-bind="template: {name: 'kbi_collection_node', data: kbi.nvm('root', true, $data)}"></ul>
  <script type='text/javascript'>
    var your_collection = new Backbone.Collection([{name: 'Hello', place: 'World!'}, {name: 'Goodbye', place: 'Samsara!'}]);
    ko.applyBindings(kb.collectionObservable(your_collection, {view_model: kb.ViewModel}), $('#collection')[0]);
  </script>
````


Building, Running and Testing the library
-----------------------

###Installing:

1. install node.js: http://nodejs.org
2. install node packages: 'npm install'

###Commands:

Look at: https://github.com/kmalakoff/easy-bake