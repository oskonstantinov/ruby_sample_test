require 'rspec'
require 'airborne'
require_relative '../api_helper'

describe 'sample' do
  it 'first_sample' do
    get GET_id
    expect_status(200)
    expect_json(id: 6)
  end
end