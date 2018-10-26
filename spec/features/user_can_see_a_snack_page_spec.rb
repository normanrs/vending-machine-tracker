require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  before(:each) do
    @owner = Owner.create(name: "Sam's Snacks")
    @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
    @turing  = @owner.machines.create(location: "Turing Basement")
    @snack_1 = @dons.snacks.create(name: "White Castle Burger", price: 3.50)
    @snack_2 = @dons.snacks.create(name: "Pop Rocks", price: 1.50)
    @snack_3 = @dons.snacks.create(name: "Flaming Hot Cheetos", price: 2.50)
    require "pry"; binding.pry

  end

  scenario 'they see the snack details' do
    visit snack_path(@snack_3)
    expect(page).to have_content(@snack_1.price)
    expect(page).to have_content(@snack_1.name)
    expect(page).to have_content(@snack_1.locations)
  end

end
