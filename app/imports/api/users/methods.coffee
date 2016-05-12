###
  Collection of methods.
###

{ ValidatedMethod } = require 'meteor/mdg:validated-method'
{ SimpleSchema } = require 'meteor/aldeed:simple-schema'

# FIXME: Changed from user object to passing in the email and password directly. Need to fix wherever this is called
module.exports.registerUser = new ValidatedMethod
  name: 'users.registerUser'
  validate: new SimpleSchema
    email:
      type: String
    password:
      type: String
  .validator()
  run: ({ email, password }) ->
    # Create the user's account.
    id = Accounts.createUser(
      email: email
      password: password
    )
    # Once the user account is created, set their role. This is optional, but
    # good to segment user accounts (e.g. admins and testers different access
    # rights of the application).
    Roles.addUsersToRoles(id, ['tester'])

