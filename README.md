# NP-Twit

NP Twit is a web application made to connect to and explore Twitter API functionality using Ruby on Rails. It allows you to schedule your tweets in to the future after connecting your twitter account.

## Limitations

This app was deployed to Heroku where the default behavior of web dynos is to sleep every thirty minutes if no request was made to the website. Because of this, the application cannot send out scheduled tweets while the dynos are sleeping.
