###
  Controller: Signup
  Template: /client/views/public/signup.html
###

# Created
Template.signup.created = ->
  # Code to run when template is created goes here.

# Rendered
Template.signup.rendered = ->
  $('#application-signup').validate(
    rules:
      emailAddress:
        required: true
        email: true
      password:
        required: true
        minlength: 6
      betaToken:
        required: true
    messages:
      emailAddress:
        required: "Please enter your email address to sign up."
        email: "Please enter a valid email address."
      password:
        required: "Please enter a password to sign up."
        minlength: "Please use at least six characters."
      betaToken:
        required: "A valid beta token is required to sign up."
    submitHandler: ->
      # Grab the user's details.
      user =
        email: $('[name="emailAddress"]').val().toLowerCase()
        password: $('[name="password"]').val()
        betaToken: $('[name="betaToken"]').val()

      #TODO: eventually refactor this
      if Package[ 'gemapp:beta-invites' ]
        Meteor.call 'registerBetaUser', user, (error)->
          if error
            alert error.reason
          else
            # To get user roles, we need to create users on the server manually.
            # We need to login users manually here.
            # Note: we're making the assumption that our user exists because
            # we're calling this after our user was created on the server. If
            # for some reason they were not created, this will fail (server
            # disconnected unexpectedly).
            Meteor.loginWithPassword(user.email, user.password, (error)->
              if error
                alert error.reason
              else
                # Redirect to profile page
                Router.go '/profile'
            )
      else
        Meteor.call 'registerUser', user, (error)->
          if error
            # Display error to user if there was one
            alert error.reason
          else
            Meteor.loginWithPassword(user.email, user.password, (error)->
              if error
                alert error.reason
              else
                # Redirect to profile page
                Router.go '/profile'
            )


  )

# Helpers
Template.signup.helpers(
  betaToken: ->
    Session.get 'betaToken'
)

# Events
Template.signup.events(
  'submit form': (e) ->
    # Prevent form from submitting.
    e.preventDefault()
)
