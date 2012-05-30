````
  _  __                 _     _                _         ___                           _
 | |/ /_ __   ___   ___| | __| |__   __ _  ___| | __    |_ _|_ __  ___ _ __   ___  ___| |_  ___  _ __
 | ' /| '_ \ / _ \ / __| |/ /| '_ \ / _` |/ __| |/ /_____| || '_ \/ __| '_ \ / _ \/ __| __|/ _ \| '__|
 | . \| | | | (_) | (__|   < | |_) | (_| | (__|   <|_____| || | | \__ \ |_) |  __/ (__| |_| (_) | |
 |_|\_\_| |_|\___/ \___|_|\_\|_.__/ \__,_|\___|_|\_\    |___|_| |_|___/ .__/ \___|\___|\__|\___/|_|
                                                                      |_|
````

Knockback-Inspector.js provides an inspector tree view library for Backbone.Models and Backbone.Collections using Knockback.js

For a step-by-step guide to creating and using Knockback-Inspector, please take a look at the [full tutorial][1].

For more information on Knockback.js, please look at the website: http://kmalakoff.github.com/knockback/

The Knockout-Inspector is designed as a small standalone library that you can integrate into your own application for debugging purposes. Just include the library file and optional styling into your HTML file:

```
<script src='knockback-inspector.min.js'></script>
<link rel='stylesheet' href='knockback-inspector.css'>
```

and include the depdendent scripts: [Knockback.js][2], [Knockout.js][3], [Backbone.js][4], and [Underscore.js][4].

[1]: http://kmalakoff.github.com/knockback/tutorial_inspector_library.html
[2]: http://kmalakoff.github.com/knockback/
[3]: https://github.com/SteveSanderson/knockout/downloads/
[4]: http://documentcloud.github.com/backbone/
[5]: http://documentcloud.github.com/underscore/

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

Building the library
-----------------------

Installing:

1. install node.js: http://nodejs.org
2. install node packages: (sudo) 'npm install'

Commands:

1. 'cake build' - performs a single build
2. 'cake watch' - automatically scans for and builds the project when changes are detected

The library itself is in the root directory, but you can also build each tutorial individually using the Cakefile in their own directories.
