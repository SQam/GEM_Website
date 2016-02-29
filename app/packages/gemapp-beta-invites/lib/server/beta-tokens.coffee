###
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#FIXME: The scoping on the functions is wrong but we're abandoning it anyway :(
  Beta Tokens
  Collection of methods for handling beta tokens.
  Depends on registerUser method
###

Meteor.methods(

  registerBetaUser: (user)->
    if validBetaToken user
      if Meteor.call 'registerUser', user
        invalidateBetaToken user
      else
        throw new Meteor.Error "register-fail", "Hmm, registration failed, contact admin."
    else
      throw new Meteor.Error "bad-match", "Hmm, this token doesn't match your email. Try again?"
    # Return true so our method completes.
    true


)

validBetaToken: (user)->
  # Check the email and token arguments against our expected patterns.
  # Note: we're using two check's here because we've passed our arguments
  # as individual variables as opposed to a single object or array.
  check(user,{email: String, password: String, betaToken: String})

  # Attempt to find a user with a matching email and token.
  testInvite = Invites.findOne({email: user.email, token: user.betaToken}, {fields: {"_id": 1, "email": 1, "token": 1}})

  # If the email and token do not match, throw an error. If the email and
  # token do match, invalidate the token by deleting it and return true. We
  # also want to flag the invite as having an account created.
  if not testInvite
    false
  # Return true so our method completes.
  true


invalidateBetaToken: (user)->
  # Attempt to find a user with a matching email and token.
  testInvite = Invites.findOne({email: user.email, token: user.betaToken}, {fields: {"_id": 1, "email": 1, "token": 1}})
  # Remove the token from our invite so it cannot be used again.
  Invites.update(testInvite._id,
    $set:
      accountCreated: true
    $unset:
      token: ""
  )
  # Return true so our method completes.
  true
