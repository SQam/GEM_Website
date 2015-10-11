# GEM Website Repo

This repo is a MeteorJS project with everything needed to setup an instance of the GEM webapp.

* Why choose meteor for this project?
	* Full stack development in JavaScript, templating in views, and integration with MongoDB.
	* Webapp feeling with different views of the same page (so no reloading), easier transition to mobile and mobile app (with cordova), and webapp mindset instead of webpage mindset (eg like Trello not Wikipedia).
	* More details here: [http://wiki.dandascalescu.com/essays/why_meteor](http://wiki.dandascalescu.com/essays/why_meteor)
Good 25min intro: [https://youtu.be/dOCMpoeuwTI](https://youtu.be/dOCMpoeuwTI)

* What is the Beta Invites package?

The beta-invites package is meant to hold all of the features related to the beta-invite system.
It's done by abstracting away templates from the core package into the beta-invites package and
only loading them if the beta-invites package is installed. Ideally we should be able to remove 
the beta-invite package and the webapp would be running without the beta-invite system. A good
example of this architecture is with a project called Telescope
[https://github.com/TelescopeJS/Telescope](https://github.com/TelescopeJS/Telescope).

* How does the login process work?

1. Starts in app/packages/gemapp-core/lib/client/templates/header.html, with a login button that links to the login page. 
2. On the app/packages/gemapp-core/lib/client/templates/public/login.html page, the user inputs their email and password.
3. Processing that is handled in /app/packages/gemapp-core/lib/client/templates/public/login.coffee
4. Once rendered, a method is called to the server to make the actual login: Meteor.loginWithPassword(user.email, user.password)
5. That function is defined in a package called accounts-password which is included into our project with app/packages/gemapp-lib/package.js.
You can see the API for the function here: http://docs.meteor.com/#/full/meteor_loginwithpassword

* What is the inspiration for the GEM project?

[https://drive.google.com/open?id=0BycydH5QLyRsRmpoRTVtcXlyVUIwREF4Qm0ybk80UnBRSnFN](https://drive.google.com/open?id=0BycydH5QLyRsRmpoRTVtcXlyVUIwREF4Qm0ybk80UnBRSnFN)


## Rough Page Outlines
* gemmovement.org/coming-soon.html <--Landing page
	* GEM Logo
	* Template: about-gem
	* Video of how it works
	* Template: beta-signup
	* Template: contact-us
* gemmovement.org/profile.html <--Profile page for all users
	* view/change profile photo
	* view/change display name
	* view/change personal bio (like LinkedIn)
	* view/change location (country (US only for now), state, city)
	* view/change year of birth (to tell whether to classify as youth)
	* view/change email
	* view/change select one or more interests (pictures and descriptions of each)
	* Supporter Only:
		* Supporter type (individual vs organization)
		* view/change support. Maybe keywords? Maybe just Time, Money, Products, Services catagories?
		* Description/Examples of support
	* Note: Recommend using this package: https://atmospherejs.com/socialize/user-profile
* gemmovement.org/signup.html
	* User can pick between Youth, mentor and Supporter
	* "Youth" and description (to be provided)
	* "Mentor" and description (to be provided)
	* "Supporter" and description (to be provided)
	* User clicks on "Register"
	* Redirects to account setup (profile page)
* gemmovement.org/dashboard.html <--User dashboard
	* TBD...
* gemmovement.org/login.html
	* TBD...
* gemmovement.org/invites.html <-- Admin access to beta invite system
	* TBD...
* gemmovement.org/not-found.html
	* TBD...


## Rough Templates
* contact-us
	* Mention we are interested in volunteers too
	* Provide a way of contact. TBD
* beta-signup
	* Provide way for youth, mentors and supporters to join beta.
	* We collect information such as email, etc.
* about-gem
	* All about the GEM Movement.  youth, mentors and supporters.
	* Goal of the project.
	* Link to Circle Of Children.
* closed-invitations
	* 
* open-invitations
	* 
* signup-count
	* Print string with number of request for invites in DB
* reset-password
	* 
* updates
	*

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

## Deployment
npm install -g mupx # install meteor-up for deployment
cd ./deploy && mupx deploy

 
## Repo File Organization

```python
├── app # Main app directory to hold packages and static assets.
│   ├── packages # All GEM code goes here in its respective package
│   │   ├── gemapp-beta-invites # beta-invite add-on related code
│   │   │   ├── lib
│   │   │   │   ├── client
│   │   │   │   │   ├── collection-invites.coffee
│   │   │   │   │   └── templates
│   │   │   │   │       ├── beta-signup-count.coffee
│   │   │   │   │       └── request-beta-invite.html
│   │   │   │   ├── routes.coffee
│   │   │   │   └── server
│   │   │   │       ├── beta-tokens.coffee
│   │   │   │       ├── email
│   │   │   │       │   ├── templates
│   │   │   │       │   │   └── send-invite.handlebars
│   │   │   │       │   └── validation.coffee
│   │   │   │       ├── invites.coffee
│   │   │   │       └── publications.coffee
│   │   │   └── package.js
│   │   ├── gemapp-core # Contains everything that doesn't makes sense to be put in a separate package
│   │   │   ├── lib
│   │   │   │   ├── client
│   │   │   │   │   ├── helpers-ui.coffee
│   │   │   │   │   ├── stylesheets
│   │   │   │   │   └── templates
│   │   │   │   │       ├── authenticated
│   │   │   │   │       │   ├── dashboard.html
│   │   │   │   │       │   └── profile.html
│   │   │   │   │       ├── header.coffee
│   │   │   │   │       ├── header.html
│   │   │   │   │       ├── index.html
│   │   │   │   │       ├── layout-default.html
│   │   │   │   │       └── public
│   │   │   │   │           ├── coming-soon.html
│   │   │   │   │           └── updates.html
│   │   │   │   ├── router
│   │   │   │   │   ├── filters.coffee
│   │   │   │   │   └── routes-public.coffee
│   │   │   │   ├── server
│   │   │   │   │   ├── email
│   │   │   │   │   │   └── reset-password.coffee
│   │   │   │   │   └── publications.coffee
│   │   │   │   └── startup.coffee
│   │   │   └── package.js
│   │   ├── gemapp-lib
│   │   │   ├── lib
│   │   │   │   └── core.js
│   │   │   └── package.js
│   │   └── npm-packages
│   │       └── package.js
│   ├── smart.json
│   └── smart.lock
├── circle.yml
├── deploy
│   ├── mup.json
│   └── settings.json
├── README.md
├── styleguide.md
└── sync
```
Reference: [https://www.discovermeteor.com/blog/what-goes-where/](https://www.discovermeteor.com/blog/what-goes-where/)