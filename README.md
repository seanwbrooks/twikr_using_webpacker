**TWIKR**
![Code Climate](https://codeclimate.com/github/seanwbrooks/twikr_using_webpacker.png)

TWIKR is a financial communication platform for user to share their ideas and follow stocks. The application uses a React on Rails framework.

**TECHNOLOGIES:**
React is a great front-end technology that makes websites dynamic and increases user experiences by cutting down page reloads with a virtual DOM.

Rails was used for the back-end with PostGreSQL as the database. Rails is a convention-over-configuration framework that allowed me to get the application up and running without too much time spent on configuration decisions. PostGreSQL is a well documented and supported database that is also supported by Heroku.

Jasmine/Enzyme is used for testing the React components. RSpec is used for testing unit tests, such as controllers and models, on the back-end.

**SETUP:**
To get setup run,
```
bundle
rake db:create
rake db:migrate
rails s
```

In a separate terminal run,
```
yarn
npm start
```

Open a browser and go to `localhost:3000`

To run Ruby tests,
`rake`

To run Jasmine/Enzyme tests,
`karma start`
