json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :name, :group, :price, :date
  json.url purchase_url(purchase, format: :json)
end
