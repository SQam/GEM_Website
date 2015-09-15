# GEM Website Repo

This repo is meant to be everything needed to setup an instance of the GEM
website.


Why choose meteor for this project?
[http://wiki.dandascalescu.com/essays/why_meteor](http://wiki.dandascalescu.com/essays/why_meteor)

## Repo Organization
[https://www.discovermeteor.com/blog/what-goes-where/](https://www.discovermeteor.com/blog/what-goes-where/) 
```python
├── app #Main app directory with deployed code
│   ├── client #Code sent to the client only
│   │   ├── controllers
│   │   │   ├── closed-invitations.coffee
│   │   │   ├── header.coffee
│   │   │   ├── open-invitations.coffee
│   │   │   ├── index.coffee
│   │   │   ├── login.coffee
│   │   │   ├── recover-password.coffee
│   │   │   ├── reset-password.coffee
│   │   │   ├── signup.coffee
│   │   │   └── signup-count.coffee
│   │   ├── helpers
│   │   │   └── helpers-ui.coffee
│   │   ├── includes
│   │   │   └── _header.html
│   │   ├── layouts
│   │   │   └── layout-default.html
│   │   ├── routes
│   │   │   ├── filters.coffee
│   │   │   ├── routes-authenticated.coffee
│   │   │   ├── routes-global.coffee
│   │   │   └── routes-public.coffee
│   │   ├── stylesheets
│   │   │   └── sass
│   │   │       ├── application.scss
│   │   │       ├── globals
│   │   │       │   ├── _bootstrap.scss
│   │   │       │   ├── _extends.scss
│   │   │       │   └── _forms.scss
│   │   │       └── views # view-specific stylesheets (keep to minimum)
│   │   │           └── public
│   │   │               ├── _index.scss
│   │   │               └── _login.scss
│   │   └── views # All views
│   │       ├── index.html #Always loaded html
│   │       ├── authenticated
│   │       │   ├── closed-invitations.html
│   │       │   ├── dashboard.html
│   │       │   ├── invites.html
│   │       │   └──open-invitations.html
│   │       └── public # Public views
│   │           ├── index.html
│   │           ├── login.html
│   │           ├── not-found.html
│   │           ├── recover-password.html
│   │           ├── reset-password.html
│   │           ├── signup-count.html
│   │           └── signup.html
│   ├── collections # Collection code for both client and server
│   │   └── invites.coffee
│   ├── packages
│   │   └── npm-packages
│   │       └── package.js
│   ├── public # Static assests
│   │   ├── animated_favicon.gif
│   │   ├── favicon_212052
│   │   ├── favicon.ico
│   │   ├── GEM_people_in_field.png
│   │   └── logo.png
│   ├── server # Server only code
│   │   ├── admin
│   │   │   └── startup.coffee
│   │   ├── data
│   │   │   ├── insert
│   │   │   │   └── invites.coffee
│   │   │   ├── read
│   │   │   │   ├── beta-tokens.coffee
│   │   │   │   └── invites.coffee
│   │   │   └── update
│   │   │       └── invites.coffee
│   │   ├── email
│   │   │   ├── templates
│   │   │   │   ├── reset-password.coffee
│   │   │   │   └── send-invite.handlebars
│   │   │   └── validation.coffee
│   │   └── publications.coffee
│   ├── smart.json
│   └── smart.lock
├── deploy # mupx for deployment directory
│   ├── mup.json
│   └── settings.json
├── README.md
├── styleguide.md
├── styles
│   ├── main.css
│   └── updates.css
└── views
    ├── coming-soon.html
    ├── register-modal.html
    ├── sign-in.html
    ├── supporter-signup
    ├── updates.html
    ├── youth-profile-page.html
    └── youth-signup
```

## Repo Style
[OUTDATED]All code should adhere to the style guide: [styleguide.md](styleguide.md)

## Deployment
npm install -g mupx # install meteor-up for deployment
cd ./deploy-staging && mupx deploy
