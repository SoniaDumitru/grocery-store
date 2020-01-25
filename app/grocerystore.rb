  # The cart starts as an array of individual items. Translate it into a hash that includes the counts for each item with the consolidate_cart method.

  def consolidate_cart(cart:[])
   new_hash = {}
    cart.each do |items|
      items.each do |item_type, attributes|
        if new_hash[item_type].nil?
          new_hash[item_type] = attributes
          new_hash[item_type][:count] = 0
          else
            new_hash[item_type][:count] += 1
        end
      end
    end
    new_hash
  end

  # Write an apply_coupons method that takes in a cart and an Array of coupons, applying the coupons if appropriate.

  def apply_coupons(cart: [], coupons: [])
    couponed_items= {}
    coupons.each do |coupon_hash|
      cart.each do |name, item_hash|
        if name == coupon_hash[:item] && item_hash[:count] >= coupon_hash[:num]
          item_hash[:count] = item_hash[:count] - coupon_hash[:num]
          new_name = coupon_hash[:item] + " w/coupon"
          couponed_items[new_name] = { :price => coupon_hash[:cost],
                                       :count => 1,
                                       :clearance => item_hash[:clearance] }
        end
      end
    end
    cart.merge(couponed_items)
  end


# Create a checkout method that calculates the total cost of the consolidated cart.

  def checkout(cart: [], coupons: [])
    puts cart.inspect
    call_later = cart
    cart = consolidate_cart(cart: cart)
    final_cart = apply_coupons(cart: cart, coupons: coupons)
    total = 0
    final_cart.each do |name, item_hash|
      if item_hash[:clearance]
        item_hash[:price] = item_hash[:price] - (item_hash[:price] * 0.20)
      end
      total += item_hash[:price] * item_hash[:count]
    end
    if total > 100
      total = total - ( total * 0.10 )
    end
    total
  end
