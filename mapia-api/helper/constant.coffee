#### author : meinzug@me.com : 2015.02.27 07:29

#### load module
jwt = require "jsonwebtoken"

#### server
exports.SERVER_HOST       = "0.0.0.0"
exports.SERVER_PORT       = 8080
exports.SERVER_UUID       = server_uuid = uuid.v4()
exports.SERVER_BOOTUP_UTC = datefn(new Date(), "yyyy-mm-dd HH:MM:ss Z", true)
exports.SERVER_BOOTUP_LOC = datefn(new Date(), "yyyy-mm-dd HH:MM:ss Z", false)
exports.SERVER_SECRET_KEY = server_secret = "One for All. All for One."
exports.SERVER_TOKEN_TEST = jwt.sign {foo:"bar"}, server_secret

#### mysql, mariadb
exports.MYSQL_HOST                = "localhost"
exports.MYSQL_PORT                = 3306
exports.MYSQL_USER                = "umanji"
exports.MYSQL_PASSWORD            = "18281828"
exports.MYSQL_DATABASE            = "master1"
exports.MYSQL_CONNECTION_LIMIT    = 20
exports.MYSQL_WAIT_FOR_CONNECTIONS = false

#### database
exports.TBL_USER     = "tbl_user"
exports.TBL_BUILDING = "tbl_building"

#### milliseconds
exports.MILLISEC_SEC  = 1000        # 1000 (millisec to 1 sec)
exports.MILLISEC_MIN  = 60000       # 1000 * 60
exports.MILLISEC_HOUR = 3600000     # 1000 * 60 * 60
exports.MILLISEC_DAY  = 86400000    # 1000 * 60 * 60 * 24
exports.MILLISEC_YEAR = 31536000000 # 1000 * 60 * 60 * 24 * 365

#### path
exports.API_PATH = require("app-root-path") + "/api"