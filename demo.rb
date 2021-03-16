# frozen_string_literal: true

require_relative 'lib/calculate_subscription'

CalculateSubscription.config do |c|
  c.currencies = %w[USD BTC AUD]
  c.one_week_price = 12.99
  c.three_month_price = 75.00
end

puts CalculateSubscription.new(12.99, 'USD')
