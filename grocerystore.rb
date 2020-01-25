cart = [
  {"AVOCADO" => {:price => 3.00, :clearance => true }},
  {"AVOCADO" => {:price => 3.00, :clearance => true }},
  {"KALE"    => {:price => 3.00, :clearance => false}}
]

def consolidate_cart(cart)
 new_hash = {}
  cart.each do |items|
    items.each do |item_type, attributes|
      if new_hash[item_type].nil?
        new_hash[item_type] = attributes.merge({:count => 1})
        else
          new_hash[item_type][:count] += 1
      end
    end
  end
end
