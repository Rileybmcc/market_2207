class Vendor
  attr_reader :inventory,
              :name

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(desired_item)
    @inventory[desired_item]
  end

  def stock(item_name, item_quantity)
    @inventory[item_name] += item_quantity
  end

end
