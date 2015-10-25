###
  UI Helpers
  Define UI helpers for common template functionality.
###

# Current Route
# Return an active class if the currentRoute session variable name
# (set in the appropriate file in /client/routes/) is equal to the name passed
# to the helper in the template.

UI.registerHelper('currentRoute', (route) ->
  if Session.equals 'currentRoute', route then 'active' else ''
)

# Epoch to String
# Return a formatted date string for a given unix/epoch timestamp.

UI.registerHelper('epochToString', (timestamp) ->
  moment.unix(timestamp / 1000).format("MMMM Do, YYYY")
)


# Check if template exists before rendering. Allows optional rendering
# TODO: This should be maybe in a different file
Template.registerHelper('optRender', () ->
  return if Template[this.name] then Template[this.name] else null;
)


Session.set "Mongol", {
  'collections': ['users', 'projects']
  'display': true
  'opacity_normal': ".7"
  'opacity_expand': ".9"
}
