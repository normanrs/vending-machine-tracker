require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  before(:each) do
    @owner = Owner.create(name: "Sam's Snacks")
    @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
    @snack_1 = @dons.snacks.create(name: "White Castle Burger", price: 3.50)
    @snack_2 = @dons.snacks.create(name: "Pop Rocks", price: 1.50)
    @snack_3 = @dons.snacks.create(name: "Flaming Hot Cheetos", price: 2.50)

  end

  scenario 'they see the location of that machine' do
    visit machine_path(@dons)
    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see all the snacks for a machine' do
    visit machine_path(@dons)
    expect(page).to have_content(@snack_1.name)
    expect(page).to have_content(@snack_1.price)
    expect(page).to have_content(@snack_2.name)
    expect(page).to have_content(@snack_2.price)
    expect(page).to have_content(@snack_3.name)
    expect(page).to have_content(@snack_3.price)
  end

  scenario 'they see the average snack price' do
    visit machine_path(@dons)
    expect(page).to have_content("Average Price 2.5")
  end


end
