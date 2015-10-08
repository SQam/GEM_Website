# GEM Website Repo

This repo is a MeteorJS project with everything needed to setup an instance of the GEM webapp.

* Why choose meteor for this project?

Full stack development in JavaScript, templating in views, and integration with MongoDB.
Webapp feeling with different views of the same page (so no reloading), easier transition to mobile
and mobile app (with cordova), and webapp mindset instead of webpage mindset (eg like Trello not Wikipedia).
More details here: [http://wiki.dandascalescu.com/essays/why_meteor](http://wiki.dandascalescu.com/essays/why_meteor)

* What is the Beta Invites package?

The beta-invites package is meant to hold all of the features related to the beta-invite system.
It's done by abstracting away templates from the core package into the beta-invites package and
only loading them if the beta-invites package is installed. Ideally we should be able to remove 
the beta-invite package and the webapp would be running without the beta-invite system. A good
example of this architecture is with a project called Telescope
[https://github.com/TelescopeJS/Telescope](https://github.com/TelescopeJS/Telescope).

* How does the login process work?

Starts in here with the header, with a login button that links to the login page. app/packages/gemapp-core/lib/client/templates/header.html
On the login page here takes the email and password app/packages/gemapp-core/lib/client/templates/public/login.html which displays the login
That's handled in here: /app/packages/gemapp-core/lib/client/templates/public/login.coffee
Once rendered a method is called to the server to make the actual login: Meteor.loginWithPassword(user.email, user.password,
That function is defined in a package listed in this file called accounts-password: app/packages/gemapp-lib/package.js
You can see the API for the function here: http://docs.meteor.com/#/full/meteor_loginwithpassword

* What is the inspiration for the GEM project?

[https://drive.google.com/open?id=0BycydH5QLyRsRmpoRTVtcXlyVUIwREF4Qm0ybk80UnBRSnFN](https://drive.google.com/open?id=0BycydH5QLyRsRmpoRTVtcXlyVUIwREF4Qm0ybk80UnBRSnFN)

## Repo File Organization

```python
├── app # Main app directory to hold packages and static assets.
│   ├── packages # All GEM code goes here in its respective package
│   │   ├── gemapp-beta-invites # beta-invite system related code
│   │   │   ├── lib
│   │   │   │   ├── client
│   │   │   │   │   ├── collection-invites.coffee
│   │   │   │   │   └── templates
│   │   │   │   │       ├── beta-signup-count.coffee
│   │   │   │   │       ├── beta-signup-count.html
│   │   │   │   │       ├── beta-signup.html
│   │   │   │   │       ├── closed-invitations.coffee
│   │   │   │   │       ├── closed-invitations.html
│   │   │   │   │       ├── invites.html
│   │   │   │   │       ├── invites-page-header.html
│   │   │   │   │       ├── open-invitations.coffee
│   │   │   │   │       ├── open-invitations.html
│   │   │   │   │       ├── request-beta-invite.coffee
│   │   │   │   │       └── request-beta-invite.html
│   │   │   │   ├── routes.coffee
│   │   │   │   └── server
│   │   │   │       ├── beta-tokens.coffee
│   │   │   │       ├── email
│   │   │   │       │   ├── templates
│   │   │   │       │   │   └── send-invite.handlebars
│   │   │   │       │   └── validation.coffee
│   │   │   │       ├── invites.coffee
│   │   │   │       └── publications.coffee
│   │   │   └── package.js
│   │   ├── gemapp-core # Contains everything that can't be made a plugin
│   │   │   ├── lib
│   │   │   │   ├── client
│   │   │   │   │   ├── helpers-ui.coffee
│   │   │   │   │   ├── stylesheets
│   │   │   │   │   └── templates
│   │   │   │   │       ├── authenticated
│   │   │   │   │       │   ├── dashboard.html
│   │   │   │   │       │   └── profile.html
│   │   │   │   │       ├── header.coffee
│   │   │   │   │       ├── header.html
│   │   │   │   │       ├── index.html
│   │   │   │   │       ├── layout-default.html
│   │   │   │   │       └── public
│   │   │   │   │           ├── coming-soon.html
│   │   │   │   │           └── updates.html
│   │   │   │   ├── router
│   │   │   │   │   ├── filters.coffee
│   │   │   │   │   └── routes-public.coffee
│   │   │   │   ├── server
│   │   │   │   │   ├── email
│   │   │   │   │   │   └── reset-password.coffee
│   │   │   │   │   └── publications.coffee
│   │   │   │   └── startup.coffee
│   │   │   ├── package.js
│   │   │   └── public
│   │   │       ├── animated_favicon.gif
│   │   │       ├── favicon_212052
│   │   │       ├── favicon.ico
│   │   │       ├── GEM_people_in_field.png
│   │   │       └── logo.png
│   │   ├── gemapp-lib
│   │   │   ├── lib
│   │   │   │   └── core.js
│   │   │   └── package.js
│   │   └── npm-packages
│   │       └── package.js
│   ├── smart.json
│   └── smart.lock
├── circle.yml
├── deploy
│   ├── mup.json
│   └── settings.json
├── README.md
├── styleguide.md
└── sync
```
Reference: [https://www.discovermeteor.com/blog/what-goes-where/](https://www.discovermeteor.com/blog/what-goes-where/) 

## Repo Style
[OUTDATED]All code should adhere to the style guide: [styleguide.md](styleguide.md)

## Deployment
npm install -g mupx # install meteor-up for deployment
cd ./deploy && mupx deploy

## (Draft) Data Models
* Project Model
	* Name
	* Description
	* Picture
	* Comments
	* Youth members
	* Youth owner(s)
	* Supporter members
* User Model
	* Name
	* Description
	* Picture
	* Email address
	* Location
	* My projects
	* Recent GEM activity
	* Role (either supporter, mentor, or youth)

## (Draft) Page Outlines
* coming-soon.html <--Landing page
	* Description of GEM project
	* Video of how it works
	* Subscribe here to get updates
* profile.html <--Profile page for all users
	* Profile photo (allow change)
	* Select country, state and city
	* Name
	* Date of Birth (to tell whether to classify as youth)
	* Email
	* ?Interest selection (used for mapping)
	* ?Username
	* (Supporter) Supporter type (individual vs organization)
	* (Supporter) List of support
		* Type of support (Time, Money, Products, or Services)
		* Support description
* dashboard.html <--User dashboard
	* 

sign-in.html
invites.html <-- Admin access to beta invite system
signup.html

closed-invitations.html
open-invitations.html
coming-soon.html
login.html
not-found.html
recover-password.html
reset-password.html
signup-count.html
updates.html

## TODO
-What are the URL's of each page?