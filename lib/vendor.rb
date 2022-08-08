class Vendor
  attr_reader :inventory,
              :name

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(desired_item)
    @inventory[:desired_item]
  end



end
