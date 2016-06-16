json.array!(@sales) do |sale|
  json.extract! sale, :id, :piece_id, :sale_quantity, :total
  json.url sale_url(sale, format: :json)
end
