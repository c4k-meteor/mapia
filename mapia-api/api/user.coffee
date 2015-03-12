#### author : meinzug@me.com : 2015.02.12 12:22

#### index
exports.loadIndex = (app) ->
  indexList = [
    {method: "POST",   path: "/users",      handler: post}
    {method: "GET",    path: "/users",      handler: getList}
    {method: "GET",    path: "/users/{id}", handler: get,     config: hapiHelper.validation.user_id}
    {method: "PUT",    path: "/users/{id}", handler: put}
    {method: "DELETE", path: "/users/{id}", handler: del}
  ]
  app.route indexList

#### POST /users
post = (req, reply) ->
  reply {"result": "POST"}

#### GET /users
getList = (req, reply) ->
  db.getRecords(CONST.TBL_USER)
  .then (rows) ->
    console.log rows
    reply {"result": rows}
  .catch (error) ->
    reply {"error": "error code here"}
  .finally ->
    console.log ""

#### GET /users/{id}
get = (req, reply) ->
    reply {"result": "GET"}

#### PUT /users/{id}
put = (req, reply) ->
  reply {"result": "PUT"}

#### DELETE /users/{id}
del = (req, reply) ->
  reply {"result": "DELETE"}