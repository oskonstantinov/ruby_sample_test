require 'rspec'
require 'airborne'
require_relative '../api_helper'

describe 'api test' do
  it 'first_sample' do
    get GET_posts
    expect_status(200)
    expect_json(id: 6)
  end

  it 'second_sample' do
    post POST_comments, {
        "name": POST_NAME,
        "email": POST_EMAIL,
        "body": POST_BODY
    }
    expect_status(201)
    expect_json(id: 501)
  end

  it 'third_sample' do
    patch PATCH_users, {
        "name": PATCH_NAME,
        "username": PATCH_USERNAME
    }
    expect_status(200)
    expect_json(email: 'Shanna@melissa.tv')
  end

  it 'fourth_sample' do
    put PUT_albums, {
        "userId": PUT_USER_ID,
        "title": PUT_TITTLE
    }
    expect_status(200)
  end

  it 'fifth_sample' do
    delete DELETE_photos
    expect_status(200)
  end
end