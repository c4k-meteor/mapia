#### author : meinzug@me.com : 2015.02.11 13:30

#### index
exports.loadIndex = (app) ->
  indexList = [
    {method: "POST",   path: "/helloWorld",       handler: post}
    {method: "GET",    path: "/helloWorld",       handler: getList}
    {method: "GET",    path: "/helloWorld/{id}",  handler: get}
    {method: "PUT",    path: "/helloWorld/{id}",  handler: put}
    {method: "DELETE", path: "/helloWorld/{id}",  handler: del}
  ]
  app.route indexList

#### handler
post = (req, reply) ->
  reply {"result": "POST"}

getList = (req, reply) ->
  reply {"result": "GET LIST"}

get = (req, reply) ->
  reply {"result": "GET"}

put = (req, reply) ->
  reply {"result": "PUT"}

del = (req, reply) ->
  reply {"result": "DELETE"}