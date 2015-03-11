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
    limit: 10
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
    erb :_results, layout: false
  end
end

post "/other_request" do
  coordinates = {
    latitude: params[:latitude].to_f,
    longitude: params[:longitude].to_f
  }

  parameters = {
    category: "divebars, cocktailbars",
    term: Drink.find(rand(0..Drink.count)).term,
    sort: 1,
    limit: 1,
  }

  @drink = parameters[:term]

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
  end
  @results
  erb :_results, layout: false
end

get "/favorites" do
  @user = User.find(session[:id])
  p @user.name
  erb :_favorites
end

post "/favorites/:name" do
  Favorite.create!(business_name: params[:name], business_url: params.first[0], user_id:  session[:id])
  redirect "/"
end


