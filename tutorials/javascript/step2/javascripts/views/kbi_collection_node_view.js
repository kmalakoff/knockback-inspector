kbi.CollectionNodeView = " \
<li class='kbi' data-bind=\"css: {opened: opened, closed: !opened()}\"> \
  <div class='collection' data-bind=\"click: function(){ opened(!opened()) }\"> \
    <span data-bind=\"text: (opened() ? '- ' : '+ ' )\"></span> \
    <span data-bind=\"text: name\"></span> \
  </div> \
\
  <!-- ko if: opened --> \
    <!-- ko foreach: node --> \
      <ul class='kbi' data-bind=\"template: {name: 'kbi_model_node', data: new kbi.NodeViewModel('['+$index()+']', false, $data)}\"></ul> \
    <!-- /ko --> \
  <!-- /ko --> \
</li>";
