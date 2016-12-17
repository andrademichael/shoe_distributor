require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  erb(:index)
end

get("/stores") do
  @stores = Store.all()
  erb(:stores)
end

post("/stores") do
  store_name = params.fetch("store_name")
  store_address = params.fetch
  new_store = Store.new({:name => store_name, :address => store_address})
  if new_store.save()
    redirect to("/stores")
  else
    erb(:error)
  end
end
