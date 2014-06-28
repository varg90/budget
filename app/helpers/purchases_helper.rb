module PurchasesHelper
  def sum_price(purchases)
    sum_price = 0
    purchases.each do |purchase|
      sum_price += purchase.price
    end
    (sum_price == 0) ? '' : number_to_currency(sum_price)
  end
end
