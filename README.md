# Learning Platform Rails API
Used for interacting with the `learning-react` client app.

### Environment Variables
* `API_URL` base url for the `learning-api` server
* `OXFORD_DICTIONARY_APP_ID` used for `Definitions`
* `OXFORD_DICTIONARY_APP_KEY` used for `Definitions`

### Models
#### Challenge Type
| Attribute  | Value Type     | Example      | Description |
|------------|----------------|--------------|-------------|
| `name` | `string` | `simple_q_and_a` | Machine name, used in `learning-react` for finding the corresponding challenge component |
| `template_data` | `object` | `{question: "What's up?", answer: "Not much"}` | An object, different for each instance of content type, to be documented separately in `learning-react` |

#### Challenge
the challenge model has an attribute `body` which is a `jsonb` with the following optional fields depending on the challenge type.

| Attribute  | Value Type     | Example      | Description |
|------------|----------------|--------------|-------------|
| `dependencies` | `array` | `[{id: "1", type: "simple_q_and_a"}]` | An array of Challenge objects with only `id` and `type`. type is the `challenge_type name` |
| `tags` | `array` | `["science"]` | An array of strings describing the course |
| `image_url` | `string` | `http://placehold.it/300x300` | Deprecated |
| `est_duration` | `integer` | `60` | Estimated time it would take a user to complete the course. It is calculated automatically based on  in the model `course.rb` |


#### Course
The course model has an attribute `ui` which is a `jsonb` object with the fields being used in for the user interface. Example object below. The course model has an attribute `flow` which is a `jsonb` array of all the content in order.

| Attribute  | Value Type     | Example      | Description |
|------------|----------------|--------------|-------------|
| `description` | `string` | `Awesome course` | Teaser for the course. |
| `flow` | `array` | `[{id: "1", type: "simple_q_and_a"}]` | An array of Challenge objects with only `id` and `type`. type is the `challenge_type name` |
| `ui` | `object` | `{}` | An object with fields for the the UI of displaying the course. |
| `ui.icon` | `string` | `rocket` | The name of a [Font Awesome icon](http://fontawesome.io/icons/) |
| `ui.subtle` | `string` | `swirls` | The name of an image file on the `learning-react` repo in the `public/subtle_patterns` folder. Example filename is `swirls.png` |
| `ui.primaryColor` | `string` | `#000000` | First gradient color |
| `ui.primaryColor` | `string` | `#000000` | Second gradient color |

#### Definition
Definitions are definitions for words... duh. It uses the oxford API to get definitions and saves the response in the `body` attribute. After save it parses the response and creates an array of strings definitions, stored in `definitions`.

| Attribute  | Value Type     | Example      | Description |
|------------|----------------|--------------|-------------|
| `word` | `string` | `axe` | Word to get the definition for |
| `body` | `object` | `{}` | Response from the server |
| `definitions` | `array` | `["a tool"]` | parsed definitions |

#### Event
Events are the homemade analytics from the server. They are created in parallel to Google Analytics and Mixpanel from the `learning-react`.

| Attribute  | Value Type     | Example      | Description |
|------------|----------------|--------------|-------------|
| `relations` | `object` | `{user_id: 1}` | Relations in a hash |
| `meta` | `object` | `{url: "/courses"}` | Any sort of meta data |
| `context` | `object` | `{name: "Played Video"}` | The actual data you want to track |

#### Feedback
Feedback is written feedback from the user. It is used for platform improvement and leads.

| Attribute  | Value Type     | Example      | Description |
|------------|----------------|--------------|-------------|
| `body` | `object` | `{message: "Great platform"}` | An object of the actual feedback |
| `source` | `string` | `modal feedback form` | Name of the source |

#### User
The user model is used for authentication, other related data to the user is stored in `Profile` model

##### Authentication
Authentication is handled through JWT. A POST to `/auth_token` will return a token.

POST /auth_token
```
{
  "auth": {
    "email": "z@z.com",
    "password": "password"
  }
}
```

Pass the jwt token in a header for an authetnicated request.
```
Authorization: Bearer asdfghjkl127890
```

#### Profile
Any data related to the user not for authentication.

#### Contents
Deprecated.

#### Challenge Response
The challenge response model has an attribute `input` which contains an `jsonb` object with an `analysis` property that specifies the approach to analyze the input. The `text` property is the input text.

| Attribute  | Value Type     | Example      | Description |
|------------|----------------|--------------|-------------|
| `input` | `object` | `{...}` | Object with properties for doing analysis |
| `input.analysis` | `string` | `none` or `sentiment` | Type of analysis method to be run after the save |
| `input.text` | `string` | `to be analyzed` | Text to be analyzed |
| `source` | `string` | `modal feedback form` | Name of the source |

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

#### Database

`$ bundle exec rake db:reset`

#### Testing

`$ bundle exec rspec`

#### Deployment instructions
Currently hosted on Heroku app `learning-api-production`.

`$ git push heroku master`

`$ heroku run rake db:migrate`

#### Documentation

`$ bundle exec annotate`
