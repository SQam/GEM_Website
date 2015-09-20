Router.route('dashboard',
  path: '/dashboard'
  template: 'dashboard'
  onBeforeAction: ->
    Session.set 'currentRoute', 'dashboard'
    @next()
)

Router.route('profile',
  path: '/profile'
  template: 'profile'
  onBeforeAction: ->
    Session.set 'currentRoute', 'profile'
    @next()
)
