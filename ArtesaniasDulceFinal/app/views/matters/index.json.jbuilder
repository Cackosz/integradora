json.array!(@matter) do |matter|
  json.extract! matter, :id, :name_matter, :price, :quantity, :total_inversion, :provider_id
  json.url matter_url(matter, format: :json)
end
