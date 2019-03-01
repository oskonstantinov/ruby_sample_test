RSpec.configure do |config|
  config.formatter = :html
  config.output_stream = File.open('results/api_test_result.html', 'w')
end

Airborne.configure do |config|
  config.base_url = 'https://jsonplaceholder.typicode.com'
end

#Endpoints
GET_posts = '/posts/6'
POST_comments = '/comments'
PATCH_users = '/users/2'
PUT_albums = '/albums/3'
DELETE_photos = '/photos/2865'

#Data
POST_NAME = 'my test comment'
POST_EMAIL = 'sample@mail.vq'
POST_BODY = 'test body'
PATCH_NAME = 'Sample Dude'
PATCH_USERNAME = 'AirBorNe'
PUT_USER_ID = '101'
PUT_TITTLE = 'sample album title'