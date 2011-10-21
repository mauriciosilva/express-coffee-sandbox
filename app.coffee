stitch = require "stitch"
express = require("express")

package = stitch.createPackage({
  paths: [__dirname + '/src/client', __dirname + '/src/vendor']
});

app = module.exports = express.createServer()
app.configure ->
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(__dirname + "/public")

app.configure "development", ->
  app.use express.errorHandler(
    dumpExceptions: true
    showStack: true
  )

app.configure "production", ->
  app.use express.errorHandler()

app.get "/application.js", package.createServer()

app.get "/", (req, res) ->
  res.render "index",
    title: "Express-Coffee2"

app.get "/about", (req, res) ->
  res.render "about",
    title: "Express-Coffee2"

app.listen process.env.PORT or process.env.C9_PORT or 3000
console.log "Express server listening on port %d in %s mode", app.address().port, app.settings.env


