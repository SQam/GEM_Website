Accounts.onLogin ->
  if Meteor.isClient
  # FIXME(Will): Hack. redirectAfterLogin state should really be kept in the login URL NOT Session
    # When user successfully logs in, redirect them to where they wanted to go
    redirect = Session.get 'redirectAfterLogin'
    if redirect?
      unless redirect is 'login'
        # To prevent some wierdness redirection to same page
        FlowRouter.go redirect
    else
      console.log "redirect is not defined"
      FlowRouter.go FlowRouter.path('dashboard')


# Redirect to login for authenticated paths
loggedIn = FlowRouter.group
  triggersEnter: [ ->
    console.log "loggedIn trigger"
  # Is Meteor.user() or Meteor.userId better?
    unless Meteor.loggingIn() or Meteor.userId()
      #save the path the user typed in so we can restore after login
     route = FlowRouter.current()

     unless route.route.name is 'login'
       console.log "route.name trigger"
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
    console.log 'entering admin trigger'
    unless Roles.userIsInRole Meteor.user(), [ 'admin' ]
      FlowRouter.go FlowRouter.path('dashboard')
  ]

# This should possibly be in a different package?
admin.route '/invites',
  name: "invites"
  action: ->
  # TODO(Will): Need actually re-implement data here with template level subscriptions.
  #waitOn: ->
    #Meteor.subscribe '/invites'
  #onBeforeAction: ->
    #Session.set 'currentRoute', 'invites'
    #@next()
#)
    BlazeLayout.render 'layoutDefault',
      top: "header"
      main: "invites"
