{print} = require 'util'
{spawn} = require 'child_process'
path = require 'path'

callback = ->
  spawn 'uglifyjs', ['-o', 'knockback-inspector.min.js', 'knockback-inspector.js']
  print "#{(new Date).toLocaleTimeString()} - generated knockback-inspector.min.js\n"

task 'build', 'Build javascripts/ from src/', ->
  coffee = spawn 'coffee', ['-c', '-j', 'knockback-inspector.js', 'src']
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
  coffee.on 'exit', (code) ->
    callback?() if code is 0

task 'watch', 'Watch src/ for changes', ->
  coffee = spawn 'coffee', ['-w', '-o', '.', '-j', 'knockback-inspector.js', 'src']
  coffee.stderr.on 'data', (data) ->
    print 'Error'
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
    callback?()