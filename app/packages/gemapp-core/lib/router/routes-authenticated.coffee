Accounts.onLogin ->
  if Meteor.isClient
  # FIXME(Will): Needs improvement. redirectAfterLogin state should really be kept in the login URL NOT in the Session variable
    # When user successfully logs in, redirect them to where they wanted to go
    redirect = Session.get 'redirectAfterLogin'
    if redirect?
      unless redirect is 'login'
        # To prevent some wierdness redirection to login page
        FlowRouter.go redirect
    else
      FlowRouter.go FlowRouter.path('project-menu')


# Redirect to login for paths requiring an account
loggedIn = FlowRouter.group
  triggersEnter: [ ->
    unless Meteor.loggingIn() or Meteor.userId()
     # Save the path the user typed in so we can restore after login
     route = FlowRouter.current()

     unless route.route.name is 'login'
       if Meteor.isClient
         Session.set 'redirectAfterLogin', route.path

     FlowRouter.go "login"
  ]

loggedIn.route '/dashboard',
  name: 'dashboard'
  action: ->
    BlazeLayout.render 'layoutDefault',
      top: "header"
      main: "dashboard"

loggedIn.route '/project-menu',
  name: 'project-menu'
  action: ->
    BlazeLayout.render 'layoutMenu',
      top: "header-menu"
      main: "project-menu"

loggedIn.route '/profile',
  name: 'profile'
  action: ->
    BlazeLayout.render 'layoutDefault',
      top: "header"
      main: "profile"

loggedIn.route '/logout',
  name: 'logout'
  action: ->
    Meteor.logout((error)->
      if error
        alert error.reason
      else
        FlowRouter.go FlowRouter.path('login')
    )



# ---------------------------Admin routes extending the loggedIn group
admin = loggedIn.group
  prefix: "/admin"
  triggersEnter: [ ->
    unless Roles.userIsInRole Meteor.user(), [ 'admin' ]
      FlowRouter.go FlowRouter.path('dashboard')
  ]

admin.route '/invites',
  name: "invites"
  action: ->
    BlazeLayout.render 'layoutDefault',
      top: "header"
      main: "invites"
