json.extract! product, :id, :name, :descpription, :price, :category_id_id, :created_at, :updated_at
json.url product_url(product, format: :json)
