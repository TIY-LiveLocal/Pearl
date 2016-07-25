# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Routes

`businesses#index`

- A user's page is populated with local businesses — searches the db

`businesses#find_business` path is `/find_business`

- A businesses searches for itself to claim itself — this endpoint expects a `location` parameter and a `term` parameter; a productive search might be `22 Friendly Ave` for the location and `Moe's Diner`. Notice the use of street name and restaurant name.

`businesses#yelp`

- Make a request for a businesses' yelp info; pass the business id (id from our db), and we'll pass back the yelp listing.


## User View - Dashbaord

### Featured?

zip code specific

### You?

catered to your answers to survey questions

## Surveys/Questions

### Post Questions

- Joe from 27007 - "Do you guys use Heinz or French's mustard?"

### Survey Questions

- The questions with user/business side e.g. "are you pet friendly?" v. "do you prefer pet friendly restaurants"

## Facebook Graph API

The Graph API is named after the idea of a 'social graph' - a representation of the information on Facebook composed of:

- *nodes* - basically "things" such as a User, a Photo, a Page, a Comment
- *edges* - the connections between those "things", such as a Page's Photos, or a Photo's Comments
- *fields* - info about those "things", such as a person's birthday, or the name of a Page

The Graph API is HTTP based, so it works with any language that has an HTTP library, such as cURL, urllib.


### Tokens

*User Access Token* - modify or write data on behalf of a user

*App Access Token* - modify and read app settings; also used to publish Open Graph actions.

*Page Access Token* - similar to user access tokens, but allow read andwrite on a Facebook page.

*Client Token* -  used to identify your app; isn't meant to be secretl; used to access app-level APIs, but only a very limited subset.

User access tokens come in two forms: short-lived tokens and long-lived tokens. Short-lived tokens usually have a lifetime of about an hour or two, while long-lived tokens usually have a lifetime of about 60 days.

Access tokens generated via web login are short-lived tokens, but you can convert them to long-lived tokens by making a server-side API call along with your app secret.

Limitations
Some user data that would normally be visible to an app that's making a request with an user access token isn't always visible with an app access token. If you're reading user data and using it in your app, you should use a user access token instead of an app access token.
