Package.describe({
  name: 'gemapp:lib',
  summary: 'GemApp third party libraries and global namespace.',
  version: '0.0.1',
  git: ''
});

Package.onUse(function (api) {
  api.versionsFrom(['METEOR@1.0']);

  var packages = [
    'standard-app-packages',
    'service-configuration',
    'accounts-ui',
    'accounts-base',
    'accounts-password',
    'accounts-twitter',
    'accounts-facebook',
    'alanning:roles',
    'check',
    'audit-argument-checks',
    'http',
    'audit-argument-checks',
    'cmather:handlebars-server',
    'coffeescript',
    'email',
    'iron:router',
    'jquery',
    'meteor-platform',
    'mrt:moment',
    'particle4dev:sass@0.3.0',
    'pinglamb:bootstrap3',
    'random',
    'themeteorchef:jquery-validation',
    'underscore',
  ];

  api.use(packages);

  api.imply(packages);

  api.addFiles([
    'lib/core.js',
  ], ['client', 'server']);

  api.export([
    'GemApp'
  ]);
});
