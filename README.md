# GEM Website Repo

This repo is meant to be everything needed to setup an instance of the GEM website.


Why choose meteor for this project?
[http://wiki.dandascalescu.com/essays/why_meteor](http://wiki.dandascalescu.com/essays/why_meteor)

## Repo Organization

```python
├── app # Main app directory. No GEM code should go here
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

## Data Models
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
	* Role (either supporter or youth)

##Page Outlines
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

invites.html <-- Admin access to beta invite system
signup.html
sign-in.html

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
-What's on the rest of the pages?
