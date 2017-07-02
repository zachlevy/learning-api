# Learning Platform Rails API
Used for interacting with the client app.

### Models
#### Course
The course model has an attribute `flow` which is a `jsonb` array of all the content in order.

##### Flow Object Format
```
{
  type: "content",
  id: 123
}
```

### Operations

#### Development

`$ bundle exec rails s -p 3001`

#### Ruby version

`2.3.1`

#### Configuration
Put ENV vars here

#### Database

`$ bundle exec rake db:reset`

#### Testing

`$ bundle exec rspec`

#### Services
(job queues, cache servers, search engines, etc.)

#### Deployment instructions
Currently hosted on Heroku app `learning-api-production`.

`$ git push heroku master`

`$ heroku run rake db:migrate`

#### Documentation

`$ bundle exec annotate`
