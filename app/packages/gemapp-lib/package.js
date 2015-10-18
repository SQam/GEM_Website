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
    'service-configuration',
    'spacebars',
    'reload',
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
    'cmather:handlebars-server',
    'coffeescript',
    'email',
    'mrt:moment',
    'fourseven:scss@3.3.3_3',
    'pinglamb:bootstrap3',
    'random',
    'themeteorchef:jquery-validation',
    'underscore',
    //'meteorhacks:kadira',
    'meteorhacks:fast-render@2.10.0',
    'fastclick',
    'msavin:mongol@1.5.0',
    'kadira:flow-router',
    'kadira:blaze-layout',
    'arillo:flow-router-helpers',
    'aldeed:autoform@5.7.1',
    'aldeed:collection2',
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
