express       = require('express')
graph         = require('fbgraph')
app           = module.exports = express.createServer()
config        = require('./config/facebook').config

app.configure ->
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(__dirname + "/public")

app.configure 'development', -> 
  app.use express.errorHandler(
    dumpExceptions: true
    showStack: true
  )

## TODO: add other envs

## route table
app.get "/auth", (req, res) ->
  console.log res
  unless req.query.code
    authUrl = graph.getOauthUrl(
      client_id: config.app_id
      redirect_uri: config.redirect_uri
    )
    res.redirect authUrl
    return
  graph.authorize
    client_id: config.app_id
    redirect_uri: config.redirect_uri
    client_secret: config.secret
    code: req.query.code
  , (err, facebookRes) ->
    console.log facebookRes
    res.redirect "/welcome"


app.get "/", (req, res) ->
  res.render "index",
    title: "Facebook-Sandbox"
    cs_value: "testing"

app.get "/welcome", (req, res) -> 
  res.render "index",
    title: "Facebook-Sandbox"
    cs_value: "you are logged, yo"
  

port = process.env.PORT || 3000

app.listen port, () -> 
  console.log "listening on port #{port}"




