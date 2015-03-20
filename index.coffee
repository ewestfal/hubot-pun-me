fs = require 'fs'
path = require 'path'

module.exports = (robot) ->
  scriptsPath = path.resolve __dirname, 'scripts'
  fs.exists scriptsPath, (exists) ->
    if exists
      robot.loadFile scriptsPath, file for file in fs.readdirSync(scriptsPath)
