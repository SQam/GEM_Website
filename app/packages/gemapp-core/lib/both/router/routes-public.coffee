# All public routes are in this file

FlowRouter.notFound =
  action: ->
    BlazeLayout.render 'layoutDefault',
      top: "header"
      main: "notFound"

# Note: Don't use "public" keyword because it's reserved in JS.
exposed = FlowRouter.group {}

exposed.route '/',
  name: 'coming-soon'
  action: ->
    BlazeLayout.render 'layoutDefault',
      top: "header"
      main: "coming-soon"

exposed.route '/login',
  name: 'login'
  action: ->
    BlazeLayout.render 'layoutDefault',
      top: "header"
      main: "login"

# TODO: Create real project pages
exposed.route '/project/:project_id',
  name: 'project'
  action: (params, queryParams) ->
    # TODO: Tell router to look at our :project parameter and assign it to a
    # session variable so that we can access it in our template.
    #Session.set 'project_id', @params.peoject_id
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
    BlazeLayour.render 'recoverPassword'

exposed.route '/reset-password/:token',
  name: 'resetPassword'
  action: ->
    BlazeLayour.render 'resetPassword'
    Session.set 'resetPasswordToken', @params.token
