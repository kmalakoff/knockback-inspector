module.exports =
  library:
    join: 'knockback-inspector.js'
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
        'cp knockback-inspector.js packages/nuget/Content/Scripts/knockback-inspector.js'
        'cp knockback-inspector.min.js packages/nuget/Content/Scripts/knockback-inspector.min.js'
        'cp knockback-inspector.css packages/nuget/Content/Scripts/knockback-inspector.css'
      ]

  tests:
    output: 'build'
    directories: [
      'test/core'
    ]
    _build:
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
      'cp underscore vendor/underscore-latest.js'
      'cp backbone vendor/backbone-latest.js'
      'cp backbone-relational vendor/backbone-relational-latest.js'
      'cp knockout-client/knockout.debug.js vendor/knockout-latest.js'
      'cp knockback vendor/knockback-latest.js'
    ]