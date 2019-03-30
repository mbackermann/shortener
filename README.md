### Challenge Description

__CHALLENGE__: Your mission, should you choose to accept it, is to make a URL shortener API.
#### CORE REQUIREMENTS

- We must be able to put a URL into the home page and get back a URL of
the shortest possible length.
- We must be redirected to the full URL when we enter the short URL (ex:
http://myshortener.whatever/a => https://google.com).
- There must be an endpoint that returns the top 100 most frequently
accessed URLs.
- There must be a background job (resque, sidekiq, activejob, etc) that
crawls the URL being shortened, pulls the \<title> from the website and
stores it.
- Display the title with the URL on the top 100 board.
- There must be a README that explains how to setup the application and
the algorithm used for generating the URL short code.
* Write a bot to populate your DB, and include it in the source code

#### DELIVERABLES

##### NOTES / HINTS

- Deploy to Heroku or any other free host you're comfortable with.
- Code must be on GitHub.
- Be verbose with your commit messages as this will allow us to understand
some of the decisions you make throughout the process.
Since the first part of the challenge is technically headless, here are some
cURL commands to help you get started:
- curl -X POST -d "url=https://google.com" http://localhost/url.json
o Should return JSON with a short URL or errors
- curl http://localhost/top.json
o Should return JSON with the top 100 URLs
- curl -I http://localhost/abc
o Should show the URL that the app is redirecting you to
- The cURL examples above are not requirements. Feel free to use
different parameter names, input types, and URLs.

- Research and understand how Bit.ly and TinyURL actually work before
you decide on how to generate URLs of the shortest possible length.
- You may use Rails, Sinatra, or Padrino for your application.
- You may use HTTParty or any other HTTP library you'd like for fetching
the \<title> tag from the URL.
- You can use whatever database you are comfortable with. For the
purposes of this exercise, we recommend a relational database.
- Don't forget things like validations and demonstrating good clean Object
Oriented Programming.

### Usage ###
```
git clone https://github.com/mbackermann/shortener.git
cd shortener
bundle install
rake db:create db:migrate
rails s
```
You can also check the API demo through

[Demo](https://pacific-sands-14294.herokuapp.com/top)

#### Endpoints ####

```
POST /urls # Creates a shortener for an URL
params:
  url (string, required): url wanted to be shortened
```

```
GET /top # Show top 100 websites most frequently visited
```


### Algorithm Explained

I used the SecureRandom library to generate a base58 hash of 6 chars length.
Then I check if it already exists in database. If it exists, generate another.


### Populate Database

If you want to populate the database, just run
````
rake db:seed
````

### Background Jobs

I used ActiveJob to retrieve the website's title whenever an URL is shortened
