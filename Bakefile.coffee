module.exports =
  library:
    join: 'knockback-inspector.js'
    wrapper: 'src/module-loader.js'
    compress: true
    files: [
      'src/lib/kbi_core.coffee'
      'src/lib/kbi_template_engine.coffee'
      'src/models/**/*.coffee'
      'src/view_models**/*.coffee'
      'src/views**/*.coffee'
    ]
    _build:
      commands: [
        'cp knockback-inspector.js packages/npm/knockback-inspector.js'
        'cp knockback-inspector.min.js packages/npm/knockback-inspector.min.js'
        'cp knockback-inspector.css packages/npm/knockback-inspector.css'
        'cp README.md packages/npm/README.md'
        'cp knockback-inspector.js packages/nuget/Content/Scripts/knockback-inspector.js'
        'cp knockback-inspector.min.js packages/nuget/Content/Scripts/knockback-inspector.min.js'
        'cp knockback-inspector.css packages/nuget/Content/Scripts/knockback-inspector.css'
      ]

  tests:
    _build:
      output: 'build'
      directories: [
        'test/core'
      ]
      commands: [
        'mbundle test/packaging/bundle-config.coffee'
        'mbundle test/lodash/bundle-config.coffee'
      ]
    _test:
      command: 'phantomjs'
      runner: 'phantomjs-qunit-runner.js'
      files: '**/*.html'
      directories: [
        'test/core'
        'test/packaging'
        'test/lodash'
      ]

  _postinstall:
    commands: [
      'cp -v knockback/knockback-core-stack.js vendor/knockback-core-stack.js'
      'cp -v backbone-relational vendor/backbone-relational.js'
      'cp -v lodash vendor/lodash.js'

      'cp -v underscore test/vendor/underscore.js'
      'cp -v backbone test/vendor/backbone.js'
      'cp -v knockout-client/knockout.debug.js test/vendor/knockout.js'
      'cp -v knockback/knockback-core.js test/vendor/knockback-core.js'
    ]