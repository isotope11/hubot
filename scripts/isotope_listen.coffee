http = require "http"

module.exports = (robot) ->
  server = http.createServer (req, res) ->
    if req.url is "/isotope_listen"
      data = ""
      req.setEncoding "utf8"

      req.on "data", (chunk) ->
        data += chunk

      req.on "end", ->
        body = JSON.parse data
        message = body.message
        user = robot.userForId 'broadcast'
        robot.send user, message
          
  server.listen 32888, "0.0.0.0"
