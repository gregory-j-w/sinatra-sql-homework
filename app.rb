require 'bundler'
Bundler.require

conn = PGconn.open(dbname: 'beer')

get '/pale_ales' do
  content_type :json
  res = conn.exec('SELECT id, brewer, name, type, abv, ibu, image_url, price, in_stock FROM pale_ale;')
  pale_ales = []
  res.each do |pale_ale|
    pale_ales.push(pale_ale)
  end
  pale_ales.to_json
end

get '/pale_ales/:id' do
  id = params[:id]
  res = conn.exec('SELECT id, brewer, name, type, abv, ibu, image_url, price, in_stock FROM pale_ales WHERE id = #{id};')
  pale_ale = res[0]
  pale_ale.to_json
end

post '/pale_ales' do
  new_pale_ale = JSON.parse(request.body.read)
  brewer = new_pale_ale["brewer"]
  name = new_pale_ale["name"]
  type = new_pale_ale["type"]
  abv = new_pale_ale["abv"]
  ibu = new_pale_ale["ibu"]
  image_url = new_pale_ale["image_url"]
  price = new_pale_ale["price"]
  in_stock = new_pale_ale["in_stock"]
  conn.exec("INSERT INTO pale_ales (brewer, name, type, abv, ibu, image_url, price, in_stock)
            VALUES ('#{brewer}', '#{name}', '#{type}', '#{abv}', '#{ibu}', '#{image_url}', '#{price}', '#{in_stock}');")
  "success"
end

patch '/pale_ales/:id' do
  id = params[:id]
  updated_pale_ale = JSON.parse(request.body.read)
  brewer = updated_pale_ale["brewer"]
  name = updated_pale_ale["name"]
  type = updated_pale_ale["type"]
  abv = updated_pale_ale["abv"]
  ibu = updated_pale_ale["ibu"]
  image_url = updated_pale_ale["image_url"]
  price = updated_pale_ale["price"]
  in_stock = updated_pale_ale["in_stock"]
  conn.exec("UPDATE pale_ales SET brewer = #{brewer}', name = '#{name}', type = '#{type}', abv = '#{abv}', ibu = '#{ibu}', image = '#{image_url}', price = '#{price}', in_stock = '#{in_stock} WHERE id = #{id}")
  "success"
end

delete '/pale_ales/:id' do
  id = params ["id"]
  conn.exec("DELETE FROM pale_ales WHERE id = #{id};")
  "success"
end
