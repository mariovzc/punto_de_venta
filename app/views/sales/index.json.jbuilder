json.array!(@sales) do |sale|
  json.extract! sale, :id, :fecha, :subtotal, :total, :client_id, :user_id, :estado
  json.url sale_url(sale, format: :json)
end
