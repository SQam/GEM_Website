###
  Collection of methods.
###

Meteor.methods(

  registerUser: (user)->
    check(user,{email: String, password: String})
    # Create the user's account.
    id = Accounts.createUser(
      email: user.email
      password: user.password
    )
    # Once the user account is created, set their role. This is optional, but
    # good to segment user accounts (e.g. admins and testers different access
    # rights of the application).
    Roles.addUsersToRoles(id, ['tester'])
    # Return true so our method completes.
    # Note: If there are errors they will be returned.
    true

)

