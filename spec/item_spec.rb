require './lib/item'

RSpec.describe Item do

  before :each do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  it 'can instantiate item' do
    expect(@item1).to be_instance_of(Item)
  end

  it 'can access item name' do
    expect(@item2.name).to eq("Tomato")
  end

 xit 'can access item price' do
   expect(@item2.price).to eq(0.5)
 end

end
