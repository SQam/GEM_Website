Package.describe({
  name: 'gemapp:core',
  summary: 'GemApp core libraries.',
  version: '0.0.1',
  git: ''
});

Package.onUse(function(api) {
  api.versionsFrom("METEOR@1.0");

  var packages = [
    'gemapp:lib@0.0.1',
  ];

  api.use(packages);

  api.imply(packages);

  api.addFiles([
    'lib/router/routes-authenticated.coffee',
    'lib/router/routes-public.coffee',
  ], ['client', 'server']);

  api.addFiles([
    'lib/client/startup.coffee',
    'lib/client/helpers-ui.coffee',
    'lib/client/templates/index.html',
    'lib/client/templates/public/recover-password.html',
    'lib/client/templates/public/recover-password.coffee',
    'lib/client/templates/public/reset-password.html',
    'lib/client/templates/public/reset-password.coffee',
    'lib/client/templates/public/signup.html',
    'lib/client/templates/public/signup.coffee',
    'lib/client/templates/public/login.html',
    'lib/client/templates/public/login.coffee',
    'lib/client/templates/header.html',
    'lib/client/templates/header.coffee',
    'lib/client/templates/layout-default.html',
    'lib/client/stylesheets/application.scss',
    'lib/client/stylesheets/globals/_bootstrap.scss',
    'lib/client/stylesheets/globals/_extends.scss',
    'lib/client/stylesheets/globals/_forms.scss',
    'lib/client/stylesheets/views/public/_index.scss',
    'lib/client/stylesheets/views/public/_login.scss',
    'lib/client/templates/authenticated/dashboard.html',
    'lib/client/templates/authenticated/profile.html',
    'lib/client/templates/public/landing-page.html',
    'lib/client/templates/public/introduction-supporter.html',
    'lib/client/templates/public/introduction-youth.html',
    'lib/client/templates/public/not-found.html',
    'lib/client/templates/public/updates.html',
  ], 'client');

  api.addFiles([
    'lib/server/publications.coffee',
    'lib/server/startup.coffee',
    'lib/server/email/reset-password.coffee'
  ], 'server');



});
