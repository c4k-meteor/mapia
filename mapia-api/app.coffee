
#### load module : KEEP a ORDER !!
hapi              = require "hapi"
global.datefn     = require "dateformat"
global.uuid       = require "node-uuid"
global.CONST      = require "./helper/constant.coffee"
global.db         = require "./helper/mysqlHelper.coffee"
global.hapiHelper = require "./helper/hapiHelper.coffee"

#### init helper
db.initDbms()

#### init hapi
app = new hapi.Server()
hapiHelper.initConfig(app)
hapiHelper.initPlugin(app)
hapiHelper.initRoute(app, true)

#### run hapi
app.start()

#### start log
console.log "======================================================"
console.log "Server started.."
console.log CONST.SERVER_BOOTUP_UTC
console.log CONST.SERVER_BOOTUP_LOC + "\n"
console.log "http://" + CONST.SERVER_HOST + ":" + CONST.SERVER_PORT
console.log "uuid: " + CONST.SERVER_UUID
console.log "token: " + CONST.SERVER_TOKEN_TEST
console.log "======================================================"
