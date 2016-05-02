###
  Startup
  Collection of methods and functions to run on server startup.
###

Meteor.startup(->
  ###
    Define environment variables.
  ###

  # Define MAIL_URL
  # Note: prints to stdout when undefined
  #process.env.MAIL_URL = 'Insert your own MAIL_URL from your email provider here.'

  ###
    Generate Test Accounts
    Creates a collection of test accounts automatically on startup.
  ###

  # Create an array of user accounts.
  users = [
	#Note: you must delete the users to make the following relevant
    { name: "Admin", email: "admin@admin.com", password: "GCgm7LjzrcHjDxFK9nYC", roles: ['admin'] },
    { name: "Beatrix Beta", email: "beatrix@beta.com", password: "password", roles: ['tester'] }
  ]

  # Loop through array of user accounts.
  for user in users

    # Check if the user already exists in the DB.
    checkUser = Meteor.users.findOne({"emails.address": user.email});

    # If an existing user is not found, create the account.
    if not checkUser

      id = Accounts.createUser(
        email: user.email
        password: user.password
        profile:
          name: user.name
      )

      if user.roles.length > 0
        Roles.addUsersToRoles(id, user.roles)
)
