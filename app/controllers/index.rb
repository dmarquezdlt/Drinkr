get "/" do
  erb :index
end

post "/new_request" do
  coordinates = {
    latitude: params[:latitude].to_f,
    longitude: params[:longitude].to_f
  }

  parameters = {
    category: "divebars, cocktailbars",
    term: params[:term],
    sort: 1,
    limit: 4,
    sort: 0
  }

  @results = {
    name: nil,
    rating: nil,
    address: nil,
    url: nil,
    image: nil,
    category: nil,
    description: nil,
    distance: nil,
    closed: nil
  }

  @yelp_search = Yelp.client.search_by_coordinates(coordinates,parameters)
  p @yelp_search
  @yelp_search.businesses.map! do |x|
    @results[:name] = x.name
    @results[:rating] = x.rating
    @results[:address] = x.location.display_address.join(", ")
    @results[:url] = x.url
    @results[:image] = x.image_url
    @results[:category] = x.categories
    @results[:description] = x.snippet_text
    @results[:distance] = x.distance
    @results[:closed] = x.is_closed
    erb :_results
  end
end


get "/results" do
  p params

  p "results"
  erb :results
end
