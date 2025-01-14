require 'date'

class Market
  attr_reader :date,
              :name,
              :vendors

  def initialize(market_name)
    @name = market_name
    @vendors = []
    @date = Date.today.strftime("%d/%m/%Y")
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

  def overstocked_items
    list_of_items_sold.select { |item| total_inventory[item][:quantity] > 50}
  end

  def sorted_item_list
    list_of_items_sold.map { |item| item.name }.sort
  end
end
