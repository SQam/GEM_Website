Package.describe({
  name: 'gemapp:lib',
  summary: 'GemApp third party libraries and global namespace.',
  version: '0.0.2',
  git: ''
});

Package.onUse(function (api) {
  api.versionsFrom(['METEOR@1.2']);

  var packages = [
    'standard-app-packages',
    //'service-configuration',
    'meteor-base',
    'mobile-experience',
    'mongo',
    'blaze-html-templates',
    'session',
    'jquery',
    'tracker',
    'standard-minifiers',
    'es5-shim',
    'ecmascript',
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
    'mrt:moment',
    'fourseven:scss@2.1.1',
    'pinglamb:bootstrap3',
    'random',
    'themeteorchef:jquery-validation',
    'underscore',
    //'meteorhacks:kadira',
    'meteorhacks:fast-render',
    'fastclick',
    //'msavin:mongol',
    //'aldeed:autoform',
    //'particle4dev:upload-avatar',
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
