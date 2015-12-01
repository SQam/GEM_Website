#Router.route('invites',
#  path: '/invites'
#  template: 'invites'
#  waitOn: ->
#    Meteor.subscribe '/invites'
#  onBeforeAction: ->
#    Session.set 'currentRoute', 'invites'
#    @next()
#)
