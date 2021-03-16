# frozen_string_literal: true

require 'json'

module CalculateSubscription
  class << self
    attr_accessor :amount, :currency
    attr_writer :one_week_price, :three_month_price, :currencies, :per_day_price, :response

    def config
      yield self
    end

    def one_week_price
      @one_week_price || 12.99
    end

    def three_month_price
      @three_month_price || 75.00
    end

    def per_day_price
      @per_day_price || 0.00
    end

    def currencies
      @currencies || %w[USD BTC]
    end

    def new(amount, currency)
      @amount = amount
      @currency = currency

      return @response unless validate_amount && validate_currency

      calculate_days
    end

    private

    def validate_amount
      if @amount.nil? || @amount <= 0
        @response = json_response('Please provide valid amount for subscription', 422)
        false
      else
        true
      end
    end

    def validate_currency
      if @currency.nil? || !@currencies.include?(@currency)
        @response = json_response('Please provide valid currency for subscription', 422)
        false
      else
        true
      end
    end

    def calculate_days
      convert_amount_to_usd unless @currency.eql?('USD')
      calculate_per_day_price
      @response = json_response((@amount / @per_day_price).to_i, 200)
    end

    def convert_amount_to_usd
      case @currency
      when 'BTC'
        @amount *= 47_469.10
      when 'AUD'
        @amount *= 0.77
      end
    end

    def calculate_per_day_price
      @per_day_price = if @amount <= @one_week_price
                         @one_week_price / 7
                       else
                         @three_month_price / 90
                       end
    end

    def json_response(data, status)
      { data: data, status: status }.to_json
    end
  end
end
