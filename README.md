### Usage ###
```
git clone https://github.com/mbackermann/shortner.git
cd shortner
bundle install
rake db:create db:migrate
rails s
```

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

I used the MD5 Hashing of the url and get the first 6 chars of the hash to
generate the shortener url



