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
    modes:
      build:
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
      'test/packaging'
      'test/lodash'
    ]
    modes:
      build:
        bundles:
          'test/packaging/build/bundle.js':
            underscore: 'underscore'
            backbone: 'backbone'
            'backbone-relational': 'vendor/backbone-relational-latest.js'
            knockout: 'vendor/knockout-latest.js'
            knockback: 'knockback'
            'knockback-inspector': 'knockback-inspector.js'
          'test/lodash/build/bundle-lodash.js':
            lodash: 'vendor/lodash-0.3.2.js'
            underscore: 'underscore'
            backbone: 'backbone'
            'backbone-relational': 'vendor/backbone-relational-latest.js'
            knockout: 'vendor/knockout-latest.js'
            knockback: 'knockback'
            'knockback-inspector': 'knockback-inspector.js'
        no_files_ok: 'test/packaging'
      test:
        command: 'phantomjs'
        runner: 'phantomjs-qunit-runner.js'
        files: '**/*.html'

  postinstall:
    commands: [
      'cp underscore vendor/underscore-latest.js'
      'cp backbone vendor/backbone-latest.js'
      'cp backbone-relational vendor/backbone-relational-latest.js'
      'cp knockout-client/knockout.debug.js vendor/knockout-latest.js'
      'cp knockback vendor/knockback-latest.js'
    ]