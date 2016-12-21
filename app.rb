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
  store_address = params.fetch("store_address")
  new_store = Store.new({:name => store_name, :address => store_address})
  if new_store.save()
    redirect to("/stores")
  else
    erb(:error)
  end
end

patch("/stores") do
  changing_store = Store.find(params.fetch("store_id").to_i())
  if changing_store.update("store_name", "store_address")
    redirect to "/stores"
  else
    erb(:error)
  end
end

delete("/stores") do
  doomed_store = Store.find(params.fetch("store_id").to_i())
  if doomed_store.destroy()
    redirect to "/stores"
  else
    erb(:error)
  end
end

get("/brands") do
  @brands = Brand.all()
  erb(:brands)
end

post("/brands") do
  brand_name = params.fetch("brand_name")
  brand_logo = params.fetch("brand_logo")
  new_brand = Brand.new({:name => brand_name, :logo => brand_logo})
  if new_brand.save()
    redirect to("/brands")
  else
    erb(:error)
  end
end
