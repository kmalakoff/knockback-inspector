{print} = require 'util'
{spawn} = require 'child_process'
fs = require 'fs'
path = require 'path'

LIBRARY_NAMES = {development: 'knockback-inspector.js', production: 'knockback-inspector.min.js'}

build = (watch) ->
  coffee = spawn 'coffee', (if watch then ['-w'] else []).concat(['-j', LIBRARY_NAMES.development, '-o', '.', '-c', 'src'])
  coffee.stderr.on 'data', (data) -> process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
    spawn 'uglifyjs', ['-o', LIBRARY_NAMES.production, LIBRARY_NAMES.development] if watch
  if not watch
    coffee.on 'exit', (code) ->
      spawn 'uglifyjs', ['-o', LIBRARY_NAMES.production, LIBRARY_NAMES.development] if code is 0

clean = ->
  fs.unlink(name) for key, name of LIBRARY_NAMES

##############################
# COMMANDS
##############################
task 'clean', 'Remove generated JavaScript files',  -> clean()
task 'build', 'Build library and tests',            -> clean(); build(false) # just build
task 'watch', 'Watch library and tests',            -> clean(); build(true) # build with watch