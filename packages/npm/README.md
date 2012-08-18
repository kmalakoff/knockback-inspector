[![Build Status](https://secure.travis-ci.org/kmalakoff/knockback-inspector.png)](http://travis-ci.org/kmalakoff/knockback-inspector)

Knockback-Inspector.js provides an inspector tree view library for Backbone.Models and Backbone.Collections using Knockback.js,

You can get the library here:

* [Development version][1]
* [Production version][2]
* [Styling][3]

### Dependencies

* [Knockback.js][4]
* [Knockout.js][5]
* [Backbone.js][6]
* [Underscore.js][7]


For a step-by-step guide to creating and using Knockback-Inspector, please take a look at the [full tutorial][8].

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

[1]: https://raw.github.com/kmalakoff/knockback-inspector/0.1.3/knockback-inspector.js
[2]: https://raw.github.com/kmalakoff/knockback-inspector/0.1.3/knockback-inspector.min.js
[3]: http://cloud.github.com/downloads/kmalakoff/knockback-inspector/knockback-inspector.css
[4]: http://kmalakoff.github.com/knockback/
[5]: https://github.com/SteveSanderson/knockout/downloads/
[6]: http://documentcloud.github.com/backbone/
[7]: http://documentcloud.github.com/underscore/
[8]: http://kmalakoff.github.com/knockback/tutorial_inspector_library.html
