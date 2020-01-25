1. Create a checkout method to calculate the total cost of a cart of items and apply discounts and coupons as necessary.

2. Implement a method checkout to calculate total cost of a cart of items and apply discounts and coupons as necessary. The checkout method will rely on the consolidate_cart, apply_coupons, and the apply_clearance methods.

- The consolidate_cart method
The cart starts as an array of individual items. Translate it into a hash that includes the counts for each item with the consolidate_cart method.

For instance, if the method is given the array below:

[
  {"AVOCADO" => {:price => 3.0, :clearance => true }},
  {"AVOCADO" => {:price => 3.0, :clearance => true }},
  {"KALE"    => {:price => 3.0, :clearance => false}}
]
then the method should return the hash below:

{
  "AVOCADO" => {:price => 3.0, :clearance => true, :count => 2},
  "KALE"    => {:price => 3.0, :clearance => false, :count => 1}
}
The apply_coupons method
If the method is given a cart that looks like this:

{
  "AVOCADO" => {:price => 3.0, :clearance => true, :count => 3},
  "KALE"    => {:price => 3.0, :clearance => false, :count => 1}
}
and a coupon for avocados that looks like this:

{:item => "AVOCADO", :num => 2, :cost => 5.0}
then apply_coupons should return the following hash:

{
  "AVOCADO" => {:price => 3.0, :clearance => true, :count => 1},
  "KALE"    => {:price => 3.0, :clearance => false, :count => 1},
  "AVOCADO W/COUPON" => {:price => 5.0, :clearance => true, :count => 1},
}
- Notice how there were three avocados in the cart, but the coupon only applied to two of them. This left one un-couponed avocado in the cart at $3.00 and one "bundle" of discounted avocados totalling $5.00.

- The apply_clearance method
This method should discount the price of every item on clearance by twenty percent.

For instance, if this method was given this cart:

{
  "PEANUTBUTTER" => {:price => 3.00, :clearance => true,  :count => 2},
  "KALE"         => {:price => 3.00, :clearance => false, :count => 3}
  "SOY MILK"     => {:price => 4.50, :clearance => true,  :count => 1}
}
it should return a cart with clearance applied to peanutbutter and soy milk:

{
  "PEANUTBUTTER" => {:price => 2.40, :clearance => true,  :count => 2},
  "KALE"         => {:price => 3.00, :clearance => false, :count => 3}
  "SOY MILK"     => {:price => 3.60, :clearance => true,  :count => 1}
}
The checkout method
Create a checkout method that calculates the total cost of the consolidated cart.

- When checking out, follow these steps in order:

- Apply coupon discounts if the proper number of items are present.

- Apply 20% discount if items are on clearance.

- If, after applying the coupon discounts and the clearance discounts, the cart's total is over $100, then apply a 10% discount.
