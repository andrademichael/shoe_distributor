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

get("/store/:id") do
  @store = Store.find(params.fetch("id"))
  @brands = Brand.all()
  @store_brands = @store.brands
  erb(:store)
end

patch("/store/:id") do
  @store_id = params.fetch("id").to_i()
  changing_store = Store.find(@store_id)
  new_name = params.fetch("change_store_name")
  new_address = params.fetch("change_store_address")
  changing_store.update({:name => new_name, :address => new_address})
  redirect to "/store/#{@store_id}"
end

delete("/store/:id") do
  doomed_store = Store.find(params.fetch("id").to_i())
  if doomed_store.destroy()
    redirect to "/stores"
  else
    erb(:error)
  end
end

patch("/store/:store_id/add_brand") do
  brand = Brand.find(params.fetch("add_brand"))
  store = Store.find(params.fetch("store_id"))
  store.brands.push(brand)
  redirect to("/store/#{store.id()}")
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
