json.array!(@pieces) do |piece|
  json.extract! piece, :id, :piece_name, :piece_quantity, :price, :matter_name, :category_id
  json.url piece_url(piece, format: :json)
end
