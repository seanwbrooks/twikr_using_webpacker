# [TWIKR](https://twikr.herokuapp.com)

TWIKR helps people follow stocks and share their ideas.  Users can make comments and predictions. Also, the application has an algorithm that predicts a stock's growth potential.

TWIKR is my final project for Launch Academy, a coding bootcamp in Boston, MA. There will be more features coming to TWIKR in the future.  If you have any questions or comments, feel free to contact me on [LinkedIn](https://www.linkedin.com/in/seanwbrooks/).

# Technology
* React
* JavaScript
* Foundation
* Rails
* PostgreSQL
* JSON
* CSS
* HTML
* RSpec
* Enzyme
* Jasmine

# Breakdown
**Front-End**
* React is a JavaScript library for building User Interfaces. It is a great front-end technology that makes websites dynamic and increases user experiences by cutting down page reloads with a virtual DOM.

**Framework**
* Rails is a popular convention-over-configuration framework. Rails is easy to use because of its emphasis on convention.  

**Database**
* I used a PostgreSQL database that was supported by Heroku.

**Testing**
* Jasmine/Enzyme is used for testing the front-end React components.
* RSpec is used for unit testing for API endpoints, serializers, controllers, and models.

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

Start Rails and React servers (note: in two separate tabs):
```
rails s
npm start
```

Open a browser and go to `localhost:3000`

# Tests
To run RSpec tests (located in the `/spec` folder):
```rake```

To run Jasmine/Enzyme tests (located in the `/app/javascript/react/test` folder):
```karma start```

# Badges
![Build Status](https://codeship.com/projects/ec276130-4de1-0135-1fe3-72fd8360efb5/status?branch=master)
![Coverage Status](https://coveralls.io/repos/github/seanwbrooks/twikr_using_webpacker/badge.svg?branch=master)](https://coveralls.io/github/seanwbrooks/twikr_using_webpacker?branch=master)

# Contributors
**Sean Brooks**

# Acknowledgments
I'd like to thank everyone at [Launch Academy](https://www.launchacademy.com/). 😀  My mentors and peers were valuable resources that helped me make this project possible.   
