#### author : meinzug@me.com : 2015.02.11 02:06

#### load module
joi = require "joi"

#### init config
exports.initConfig = (app) ->
  app.connection
    host  : CONST.SERVER_HOST
    port  : CONST.SERVER_PORT
    routes: {cors : true}

#### init plugin
exports.initPlugin = (app) ->
  jwtPlugOption = {}

  jwtRegisterOption =
    key:          CONST.SERVER_SECRET_KEY
    validateFunc: isExistUser

  yarPluginOption =
    maxCookieSize: 0
    cache:
      expiresIn: CONST.MILLISEC_DAY
    cookieOptions:
      password: CONST.SERVER_SECRET_KEY

  plugins = [
    {register: require("hapi-auth-jwt"), options: jwtPlugOption}
    {register: require("yar"),           options: yarPluginOption}
  ]

  app.register plugins, (err) ->
    app.auth.strategy("jwt", "jwt", false, jwtRegisterOption)

#### init route
exports.initRoute = (app, isAutomaticRouting) ->
  fs       = require "fs"
  path     = require "path"
  apiFiles = fs.readdirSync CONST.API_PATH

  if(isAutomaticRouting)
    for file in apiFiles then do (file) ->
      if path.extname(file) == ".coffee"
        filePath = CONST.API_PATH + "/" + file
        (require(filePath)).loadIndex app
  else
    require(CONST.API_PATH + "/auth.coffee"      ).loadIndex app
    require(CONST.API_PATH + "/building.coffee"  ).loadIndex app
    require(CONST.API_PATH + "/helloWorld.coffee").loadIndex app
    require(CONST.API_PATH + "/user.coffee"      ).loadIndex app


#### hapi config validation example
exports.validation =
    user_id:
      validate:
        params:
          id: joi.string().min(3).max(5)
    auth:
      auth: "jwt"

    session:
      auth: "session"


#### auth function
isExistUser = (decodedToken, callback) ->
  console.log "VALIDATE AUTH CALLED: foo: " + decodedToken.foo
  callback(null, true, {})
