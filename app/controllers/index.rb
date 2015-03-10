get "/" do
  erb :index
end

post "/new_request" do
  p params
  coordinates = {
    latitude: params[:latitude].to_f,
    longitude: params[:longitude].to_f
  }

  parameters = {
    term: params[:term],
    limit: 4,
    category: "bars"
  }
  p parameters
  @search = Yelp.client.search_by_coordinates(coordinates,parameters)
  p @search
  erb :results
end
