flickr = Flickr.new

token = flickr.get_request_token
auth_url = flickr.get_authorize_url(token['oauth_token'], :perms => 'delete')

puts "Open this url in your browser to complete the authentication process: #{auth_url}"
puts "Copy here the number given when you complete the process."
verify = gets.strip

begin
  flickr.get_access_token(token['oauth_token'], token['oauth_token_secret'], verify)
  login = flickr.test.login
  puts "You are now authenticated as #{login.username} with token #{flickr.access_token} and secret #{flickr.access_secret}"
rescue Flickr::FailedResponse => e
  puts "Authentication failed : #{e.msg}"
end

PHOTO_PATH = 'cowboy.png'
flickr.upload_photo PHOTO_PATH, :title => "Hello World", :description => "Example upload."


info = flickr.photos.getInfo(:photo_id => "49743338092")