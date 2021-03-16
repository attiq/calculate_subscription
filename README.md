# CalculateSubscription
This gem provides an easy way to calculate the subscription days for given amount
 and currency for the user to buy a subscription.
 
 ## Getting started
 
 Add this line to your application's Gemfile:
 
 ```ruby
 gem 'calculate_subscription'
 ```
 
 And then execute:
 
     $ bundle
 
 Or install it yourself as:
 
     $ gem install calculate_subscription
     
## Usage

```ruby
require 'calculate_subscription'
````

```ruby
response = CalculateSubscription.new(12.99, 'USD')
````

Default valid currencies are 'USD' and 'BTC'.

Valid currencies and Subscription Rates can be configured as follow    

```ruby
CalculateSubscription.config do |c|
  c.currencies = %w[USD BTC AUD]
  c.one_week_price = 12.99
  c.three_month_price = 75.00
end
````

### Requirements
This gem requires Ruby 2.7+