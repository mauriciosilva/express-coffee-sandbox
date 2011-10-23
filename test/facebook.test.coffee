vows = require('vows')
assert = require('assert')
facebook = require('../lib/facebook').Facebook
graph = require('fbgraph')

console.log 'testing...'

vows
  .describe('facebook units')
  .addBatch
    'before my test get an instance': 
      topic: () ->
         return facebook = new facebook('1111111111111111111','its me', "http://mauricio.no.de/auth")
      'should have a version': () -> 
        console.log do facebook.version
        assert.isNotNull facebook.version

    'facebook should have an AT':
      topic: () => 
        return null
      'AT should not be nil': () -> 
        console.log do facebook.access_token
        assert.isNotNull do facebook.access_token

  .addBatch
    'when implementing the fbgraph package':
      topic: () => 
        graph
      'we hsould have a url to authenticate with': () =>
        console.log "url is #{do facebook.graph_url}"
        assert.isNotNull do facebook.graph_url


        
  .addBatch
    'when using the fbgraph gem':
      topic: () => 
        graph
      'the version number is': () -> 
        console.log graph.version
        assert.isNotNull graph.version
  .export(module)


