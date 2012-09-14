###
knockback-inspector.js 0.1.5
(c) 2012 Kevin Malakoff.
Knockback-Inspector.js is freely distributable under the MIT license.
See the following for full license details:
  https://github.com/kmalakoff/knockback-inspector/blob/master/LICENSE
Dependencies: Knockout.js, Underscore.js, Backbone.js, and Knockback.js.
###

# import Underscore (or Lo-Dash with precedence), Backbone, Knockout, and Knockback
if not @_ and (typeof(require) isnt 'undefined') then (try _ = require('lodash') catch e then _ = require('underscore')) else _ = @_
_ = if _.hasOwnProperty('_') then _._ else _ # LEGACY
Backbone = if not @Backbone and (typeof(require) isnt 'undefined') then require('backbone') else @Backbone
ko = if not @ko and (typeof(require) isnt 'undefined') then require('knockout') else @ko
kb = if not @kb and (typeof(require) isnt 'undefined') then require('knockback') else @kb

# export or create kbi namespace
kbi = @kbi = if (typeof(exports) != 'undefined') then exports else {}
@kbi.VERSION = '0.1.5'
