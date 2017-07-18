# Learning Platform Rails API
Used for interacting with the client app.

### Models
#### Challenge
the challenge model has an attribute `body` which is a `jsonb` with the following optional fields depending on the challenge type
```
{
  est_duration: 123
}
```

A challenge `description` is a full sentence of instructions.

#### Course
The course model has an attribute `ui` which is a `jsonb` object with the fields being used in for the user interface. Example object below.
```
{
  primaryColor: "#333333",
  secondaryColor: "#999999",
  icon: "circle"
}
```

The course model has an attribute `flow` which is a `jsonb` array of all the content in order.

##### Flow Object Format
```
{
  type: "content",
  id: 123
}
```

#### Challenge Response
The challenge response model has an attribute `input` which contains an `jsonb` object with an `analysis` property that specifies the approach to analyze the input. The `text` property is the input text.

##### Input Object Format
```
{
  analysis: "sentiment",
  text: "to be analyzed"
}
```
The input will object will be resaved with a result object property for each object to be analyzed.

### Controllers
#### Courses
##### /courses
`ids` takes a csv of course ids to return. example `?ids="1,2,3"` and returns only those courses.

### Operations

#### Development

`$ bundle exec rails s -p 3001`

#### Ruby version

`2.3.1`

#### Configuration
Put ENV vars here

#### Database

`$ bundle exec rake db:reset`

Reset database with
* `$ heroku pg:reset DATABASE_URL --confirm learning-api-production`
* `$ heroku run rake db:migrate`
* `$ heroku run rake db:seed`

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
