require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do

  before :each do
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  end

  it 'can instantiate Market' do
    expect(@market).to be_instance_of(Market)
  end

  it 'can call market name' do
    expect(@market.name).to eq("South Pearl Street Farmers Market")
  end

  xit 'can call vendors array' do
    expect(@market.vendors).to eq([])
  end

  xit 'can add vendors to market' do
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @vendor3.stock(@item1, 65)
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)

    expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
  end

  xit 'can call vendor names' do
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)

    expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
  end

  xit 'can find vendors that sell an item' do
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @vendor3.stock(@item1, 65)
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)

    expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
    expect(@market.vendors_that_sell(@item4)).to eq([@vendor3])
  end

  xit 'can determine a vendors potential revinue' do
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @vendor3.stock(@item1, 65)
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)

    expect(@vendor1.potential_revenue).to eq(29.75)
    expect(@vendor2.potential_revenue).to eq(345.00)
    expect(@vendor3.potential_revenue).to eq(48.75)
  end
end
