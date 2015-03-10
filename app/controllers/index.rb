
get '/' do
  p client.search('San Francisco')
  erb :index
end