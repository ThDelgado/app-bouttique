json.extract! product, :id, :sku, :name, :price, :stock, :size, :color, :brand, :created_at, :updated_at
json.url product_url(product, format: :json)
