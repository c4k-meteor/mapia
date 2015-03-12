#### author : meinzug@me.com : 2015.02.12 12:22

#### index
exports.loadIndex = (app) ->
  indexList = [
    {method: "POST",    path: "/login",  handler: login}
    {method: "POST",    path: "/logout", handler: logout}
    {method: "POST",    path: "/auth",   handler: auth}
  ]
  app.route indexList

#### GET /login
login = (req, reply) ->
  email = req.payload.email
  password = req.payload.password

  if req.session.get(email)?
    reply {"result":"Session Found: #{email}"}
    return

  if email isnt "meinzug@me.com" or password isnt "1234"
    reply {"result": "Login Error: #{email}"}
    return

  req.session.set(email, {key: password})
  reply {"result": "Login Completed: #{email}"}

#### GET /logout
logout = (req, reply) ->
  email = req.payload.email

  if not req.session.get(email)?
    reply {"result": "Login Error"}
    return

  if req.session.get(email)
    req.session.clear(email)
    reply {"result": "Logout Completed: #{email}"}

#### GET /auth
auth = (req, reply) ->
  reply {"result": "AUTH"}