###
knockback-inspector.js 0.1.2
(c) 2012 Kevin Malakoff.
Knockback-Inspector.js is freely distributable under the MIT license.
See the following for full license details:
  https://github.com/kmalakoff/knockback-inspector/blob/master/LICENSE
Dependencies: Knockout.js, Underscore.js, Backbone.js, and Knockback.js.
###

# import Underscore, Backbone, Knockout, and Knockback
_ = if not window._ and (typeof(require) != 'undefined') then require('underscore') else window._
_ = _._ if _ and not _.VERSION # LEGACY
Backbone = if not window.Backbone and (typeof(require) != 'undefined') then require('backbone') else window.Backbone
ko = if not window.ko and (typeof(require) != 'undefined') then require('knockout') else window.ko
kb = if not window.kb and (typeof(require) != 'undefined') then require('knockback') else window.kb

# export or create Knockback namespace and kb alias
kbi = @kbi = if (typeof(exports) != 'undefined') then exports else {}
@kbi.VERSION = '0.1.2'
