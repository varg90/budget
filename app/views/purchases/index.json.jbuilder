json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :name, :category_id, :price, :date
  json.url purchase_url(purchase, format: :json)
end
