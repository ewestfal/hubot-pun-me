# Description:
#   Puns, yes, puns
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot pun me - Receive a pun

_ = require('lodash')

module.exports = (robot) ->
  robot.respond /pun me/, (msg) ->
    punMe(msg)

  punMe = (msg) ->
    msg.http('http://www.punoftheday.com/cgi-bin/arandompun.pl')
      .get() (err, response, body) ->
        regexp = /^document\.write\('&quot;(.*)&quot;<br \/>'\)/
        match = body.match regexp
        msg.send _.unescape match[1]
