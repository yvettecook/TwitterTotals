## Twitter Totals

*Note: In progress*

Simple Ruby on Rails app built to integrate with the Twitter API.

A user can enter a twitter handle, and their 'narcissism score'* is calculated

Narcissim score is calcuated by comparing the ratio of the user's tweets to the number of retweets. Hardly scientific, and surprisingly tricky to tease out of the Twitter API.


### Tools

* Ruby
* Ruby on Rails
* RSpec
* Capybara
* [Twitter gem](https://github.com/sferik/twitter)



### Aims

* Skinny controllers
* Use concerns and/or libraries
* Use subject in RSpec

### Notes

* Attemping to stub/mock model's API calls, but need to google the syntax for after_create

### Feedback

Read about Singleton
Pull twitter credentials into library (or concern?)
Add instance variables in order to ensure state of variables is persisting
Add mocks to Twitter API calls
