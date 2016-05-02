# Client startup file
Meteor.startup( ->
  Tracker.autorun ->
  # Runs reactively every time Meteor.userId() changes
    if !Meteor.userId()
      if Session.get('loggedIn')
        # get and save the current route
        route = FlowRouter.current()
        Session.set 'redirectAfterLogin', route.path
        FlowRouter.go FlowRouter.path('login')
)
