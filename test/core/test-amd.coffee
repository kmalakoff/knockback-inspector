try
  require.config({
    paths:
      'underscore': "../../vendor/test/underscore-1.5.2"
      'backbone': "../../vendor/test/backbone-1.1.0"
      'backbone-relational': "../../vendor/test/backbone-relational-0.6.0"
      'knockout': "../../vendor/knockout-3.0.0"
      'knockback': "../../vendor/test/knockback-core-0.18.1"
      'knockback-inspector': "../../knockback-inspector"
    shim:
      underscore:
        exports: '_'
      backbone:
        exports: 'Backbone'
        deps: ['underscore']
  })

  module_name = 'knockback-defaults'
  module_name = 'knockback' if (require.toUrl(module_name).split('./..').length is 1)

  # library and dependencies
  require ['underscore', 'backbone', 'knockout', 'knockback', 'knockback-inspector', 'qunit_test_runner'], (_, Backbone, ko, kb, kbi, runner) ->
    window._ = window.Backbone = window.ko = window.kbi = null # force each test to require dependencies synchronously
    # window.kb = null # force each test to require dependencies synchronously
    require ['./build/test'], -> runner.start()