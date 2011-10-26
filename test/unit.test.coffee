vows        = require('vows')
assert      = require('assert')
graph       = require('fbgraph')
facebook    = require('../lib/facebook').Facebook
config      = require('../config/facebook').config

console.log 'testing units'

vows
  .describe('facebook unit tests')
  .addBatch
    'before we do anything we need config':
      topic: () ->
         return config
      'should have a app_id': () -> 
        assert.isNotNull config.app_id
      'and should have a secret key': () => 
        assert.isNotnull config.secret  
  .export(module)

