````
 _  __                 _     _                _
| |/ /_ __   ___   ___| | __| |__   __ _  ___| | __
| ' /| '_ \ / _ \ / __| |/ /| '_ \ / _` |/ __| |/ /
| . \| | | | (_) | (__|   < | |_) | (_| | (__|   <
|_|\_\_| |_|\___/ \___|_|\_\|_.__/ \__,_|\___|_|\_\


 ___                           _
|_ _|_ __  ___ _ __   ___  ___| |_  ___  _ __
 | || '_ \/ __| '_ \ / _ \/ __| __|/ _ \| '__|
 | || | | \__ \ |_) |  __/ (__| |_| (_) | |
|___|_| |_|___/ .__/ \___|\___|\__|\___/|_|
              |_|
````

Knockback-Inspector.js provides an inspector tree view library for Backbone.Models and Backbone.Collections using Knockback.js

### For more information on Knockback.js, please look at the website: http://kmalakoff.github.com/knockback/

The Knockout-Inspector is designed as a small standalone library that you can integrate into your own application for debugging purposes. Just include the library file and optional styling into your HTML file:

- <script src='knockback-inspector.min.js'></script>
- <link rel='stylesheet' href='knockback-inspector.css'>

along with Knockback.js and its dependencies:

- [Knockout.js]:[https://github.com/SteveSanderson/knockout/downloads/]
- [Underscore.js]:[http://documentcloud.github.com/underscore/]
- [Backbone.js]:[http://documentcloud.github.com/backbone/]
- [Knockback.js]:[http://kmalakoff.github.com/knockback/]

If you want to inspect a model, set up the bindings like:

````
  <ul id='model' class='kbi' data-bind="template: {name: 'kbi_model_node', data: new kbi.NodeViewModel('root', true, $data)}"></ul>
  <script type='text/javascript'>
    var view_model = kb.viewModel(new Backbone.Model({name: 'Hello', place: 'World!'}));
    ko.applyBindings(view_model, $('#model')[0]);
  </script>
````

If you want to inspect a collection, set up the bindings like:

````
  <ul id='collection' class='kbi' data-bind="template: {name: 'kbi_collection_node', data: new kbi.NodeViewModel('root', true, $data)}"></ul>
  <script type='text/javascript'>
    var collection_observable = kb.collectionObservable(new Backbone.Collection([{name: 'Hello', place: 'World!'}, {name: 'Goodbye', place: 'Samsara!'}]));
    ko.applyBindings(collection_observable, $('#collection')[0]);
  </script>
````

For a step-by-step guide to creating and using Knockback-Inspector, please take a look at the full tutorial [here][http://kmalakoff.github.com/knockback/tutorial_inspector_library.html].


Building the library
-----------------------

Installing:

1. install node.js: http://nodejs.org
2. install node packages: (sudo) 'npm install'

Commands:

1. 'cake build' - performs a single build
2. 'cake watch' - automatically scans for and builds the project when changes are detected

The library itself is in the root directory, but you can also build each tutorial individually using the Cakefile in their own directories.
