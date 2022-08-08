class Market
  attr_reader :name,
              :vendors

  def initialize(market_name)
    @name = market_name
    @vendors = []
  end

  def add_vendor(new_vendor)
    @vendors << new_vendor
  end

  def vendor_names
    @vendors.map { |seller| seller.name }
  end

  def vendors_that_sell(desired_item)
    @vendors.select { |vendor| vendor.check_stock(desired_item) > 0 }
  end

  def list_of_items_sold
    all_items = []
    @vendors.map { |seller| seller.inventory.keys.each { |item| all_items << item } }
    all_items.uniq
  end

  def total_inventory
    full_inventory = Hash.new
    list_of_items_sold.each do |item|
      full_inventory[item] = {
        quantity: vendors_that_sell(item).map { |seller| seller.check_stock(item) }.sum,
         vendors: vendors_that_sell(item)}
    end
    full_inventory
  end


end
