{ FlowRouter } = require 'meteor/kadira:flow-router'
{ BlazeLayout } = require 'meteor/kadira:blaze-layout'
{ AccountsTemplates } = require 'meteor/useraccounts:core'
{ Session } = require 'meteor/session'

# Import to load these templates
require '../../ui/layouts/layout-default.coffee'
require '../../ui/components/header.coffee'
require '../../ui/pages/not-found.coffee'
require '../../ui/pages/landing-page.coffee'
require '../../ui/pages/login.coffee'
require '../../ui/pages/recover-password.coffee'
require '../../ui/pages/signup.coffee'
require '../../ui/pages/reset-password.coffee'
require '../../ui/pages/dashboard.coffee'

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


# --------------Public Routes

FlowRouter.notFound =
  action: ->
    BlazeLayout.render 'layoutDefault',
      top: "header"
      main: "notFound"

# Note: Don't use "public" keyword because it's reserved in JS.
exposed = FlowRouter.group {}

exposed.route '/',
  name: 'landing-page'
  action: ->
    BlazeLayout.render 'layoutDefault',
      top: "header"
      main: "landing-page"

exposed.route '/login',
  name: 'login'
  action: ->
    BlazeLayout.render 'layoutDefault',
      top: "header"
      main: "login"

exposed.route '/introduction-youth',
  name: 'introduction-youth'
  action: ->
    BlazeLayout.render 'layoutDefault',
      top: "header"
      main: "introduction-youth"

exposed.route '/introduction-supporter',
  name: 'introduction-supporter'
  action: ->
    BlazeLayout.render 'layoutDefault',
      top: "header"
      main: "introduction-supporter"

# TODO: Create real project pages
exposed.route '/project',
  name: 'project'
  action: (params, queryParams) ->
    console.log("Yeah! We are on the post:", params.postId);
    BlazeLayout.render 'layoutDefault',
      top: "header"
      main: "project"

exposed.route '/signup',
  name: 'signup'
  action: ->
    BlazeLayout.render 'layoutDefault',
      top: "header"
      main: "signup"
    # Clear out the beta token on the /signup route without a token parameter
    # so if we switch from /signup/:token, the token doesn't copy over.
    Session.set 'betaToken', ''

exposed.route '/signup/:token',
  name: 'signup'
  action: (params, queryParams) ->
    console.log "Yeah! We are on the signup:", params
    BlazeLayout.render 'layoutDefault',
      top: "header"
      main: "signup"
    # Tell Iron Router to look at our :token parameter and assign it to a
    # session variable so that we can access it in our template.
    Session.set 'betaToken', @params.token

exposed.route '/recover-password',
  name: 'recoverPassword'
  action: ->
    BlazeLayout.render 'layoutDefault',
      top: "header"
      main: "recoverPassword"

exposed.route '/reset-password/:token',
  name: 'resetPassword'
  action: ->
    BlazeLayout.render 'layoutDefault',
      top: "header"
      main: "resetPassword"
    Session.set 'resetPasswordToken', @params.token
