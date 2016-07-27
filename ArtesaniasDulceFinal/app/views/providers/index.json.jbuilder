json.array!(@providers) do |provider|
  json.extract! provider, :id, :name_enterprise, :name_pro, :first_name, :last_name, :matter, :location
  json.url provider_url(provider, format: :json)
end
