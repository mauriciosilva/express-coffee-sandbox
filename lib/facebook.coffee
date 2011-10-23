class Facebook
  ## dependenices

  graph = require('fbgraph')

  ###########################################

  ## settings from fb configuration
  constructor: (app_id, secret, callback_uri) -> 
    @app_id = app_id
    @secret = secret
    @callback_uri = callback_uri

  version:  () -> '0.0.3'

  ## this is the application's access token
  access_token: () -> 'AAACnshPOUoABAFVzk0dqF3Oo5c9j1quZBeDXvl8vPSM7oRrqREO1JZBHGyHm22jRWU6JZCWb1nHZC5HmUMZCZBZC1e94kBxJZAcZD'

  graph_url: () -> 
    graph.getOauthUrl({"client_id": @app_id, "redirect_uri": @callback_uri})

exports.Facebook = Facebook









  
  
