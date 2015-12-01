Package.describe({
  name: 'gemapp:beta-invites',
  summary: 'GemApp beta-invites libraries.',
  version: '0.0.1',
  git: ''
});

Package.onUse(function(api) {

  api.versionsFrom("METEOR@1.0");

  var packages = [
    'gemapp:lib@0.0.1',
    'gemapp:core@0.0.1',
  ];

  api.use(packages);

  api.imply(packages);

  api.addFiles([
    'lib/routes.coffee',
    'lib/client/collection-invites.coffee',
  ], ['client', 'server']);

  api.addFiles([
    'lib/client/templates/invites.html',
    'lib/client/templates/beta-signup.html',
    'lib/client/templates/invites-page-header.html',
    'lib/client/templates/closed-invitations.html',
    'lib/client/templates/closed-invitations.coffee',
    'lib/client/templates/open-invitations.html',
    'lib/client/templates/open-invitations.coffee',
    'lib/client/templates/beta-signup-count.html',
    'lib/client/templates/beta-signup-count.coffee',
    'lib/client/templates/request-beta-invite.html',
    'lib/client/templates/request-beta-invite.coffee',
  ], 'client');


  api.addFiles([
    'lib/server/publications.coffee',
    'lib/server/invites.coffee',
    'lib/server/beta-tokens.coffee',
    'lib/server/email/templates/send-invite.handlebars',
    'lib/server/email/validation.coffee',
  ], 'server');
});
