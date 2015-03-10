get "/" do
  erb :index
end

post "/new_request" do
  coordinates = {
    latitude: params[:latitude].to_f,
    longitude: params[:longitude].to_f
  }

  parameters = {
    term: params[:term],
    limit: 4,
    category: "divebars, cocktailbars"
  }
  @search = Yelp.client.search_by_coordinates(coordinates,parameters)
  @search.businesses.each do |place|
    p place.name
    p place.url
    p place.image_url
    p place.rating
    p place.snippet_text
    p place.categories
    p "__________________________________________"
  end
end
