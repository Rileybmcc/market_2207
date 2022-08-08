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

end
