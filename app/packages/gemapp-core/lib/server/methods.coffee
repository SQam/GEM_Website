###
  Collection of methods.
###

Meteor.methods(

  registerUser: (user)->
    # Check the email arguments against our expected patterns.
    # Note: we're using two check's here because we've passed our arguments
    # as individual variables as opposed to a single object or array.
    check(user,{email: String, password: String})
    # Create the user's account.
    id = Accounts.createUser(
      email: user.email
      password: user.password
    )
    # Once the user account is created, set their role to tester. This is
    # optional, but good if you want to segment user accounts during your
    # testing phase (e.g. being able to give admins and testers access to
    # different parts of the application).
    Roles.addUsersToRoles(id, ['tester'])
    # Return true so our method completes.
    true

)

