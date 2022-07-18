json.extract! order, :id, :number, :state, :total, :user_id, :created_at, :updated_at
json.url order_url(order, format: :json)
