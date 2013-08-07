get '/' do
  @urls = Url.all
  erb :index
end

post '/urls' do
  # short_url = SecureRandom.hex(4)
  @url = Url.create(name: params[:url])
  redirect '/'
end

get '/:short_url' do
  @url = Url.find_by_short_url(params[:short_url])
  @count = @url.click_count
  @new_count = @count + 1 
  @url.click_count = @new_count
  @url.save
  redirect "#{@url.name}"
end
