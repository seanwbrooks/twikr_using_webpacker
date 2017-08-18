# [TWIKR](https://twikr.herokuapp.com)

TWIKR helps people follow stocks and share their ideas.  Users can make comments and predictions. Also, the application has an algorithm that predicts a stock's growth potential.

Although TWIKR is my final project, for a coding bootcamp called Launch Academy, I plan on adding more features in the immediate future.  So TWIKR is still a work in progress. If you have any questions or comments, feel free to contact me on [LinkedIn](https://www.linkedin.com/in/seanwbrooks/).

# Technology
React is a great front-end technology that makes websites dynamic and increases user experiences by cutting down page reloads with a virtual DOM.

Rails is a convention-over-configuration framework that allowed me to get the application up and running without too much time spent on configuration decisions. I used a PostgreSQL database. PostGreSQL is supported by Heroku.

Jasmine/Enzyme is used for testing the React components.
RSpec is used for testing unit tests, such as controllers and models, on the back-end.

# Installation
Clone repo from terminal:
`git clone https://github.com/seanwbrooks/twikr_using_webpacker.git`

Change directory:
`cd twikr_using_webpacker`

Install gems, yarn, and setup database:
```
bundle
yarn install
rake db:create && rake db:migrate && rake db:seed
```

Start servers:
```
rails s
```
And in another tab:
```
npm start
```

Open a browser and go to `localhost:3000`

# Tests
To run Ruby tests,
```rake```

To run Jasmine/Enzyme tests,
```karma start```

# Badges
![Build Status](https://codeship.com/projects/ec276130-4de1-0135-1fe3-72fd8360efb5/status?branch=master)
![Coverage Status](https://coveralls.io/repos/seanwbrooks/twikr_using_webpacker/badge.png)

# Contributors
Sean Brooks
