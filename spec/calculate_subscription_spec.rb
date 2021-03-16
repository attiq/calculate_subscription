# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CalculateSubscription do
  described_class.config do |c|
    c.currencies = %w[USD BTC AUD]
    c.one_week_price = 12.99
    c.three_month_price = 75.00
  end

  it 'has a version number' do
    expect(CalculateSubscription::VERSION).not_to be nil
  end

  it 'must have a valid amount' do
    expected = { data: 'Please provide valid amount for subscription', status: 422 }.to_json
    response = described_class.new(0, 'USD')

    expect(response).to eql expected
  end

  it 'must have a valid currency' do
    expected = { data: 'Please provide valid currency for subscription', status: 422 }.to_json
    response = described_class.new(12.99, 'TFD')

    expect(response).to eql expected
  end

  it 'must return subscription days for a week price' do
    expected = { data: 7, status: 200 }.to_json
    response = described_class.new(12.99, 'USD')

    expect(response).to eql expected
  end

  it 'must return subscription days for a 3 months' do
    expected = { data: 90, status: 200 }.to_json
    response = described_class.new(75, 'USD')

    expect(response).to eql expected
  end
end
