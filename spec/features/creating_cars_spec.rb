require 'rails_helper'

feature 'Creating Cars' do
  scenario 'can create a car' do
    create_car('Ford', 'Mustang', 1967, 2_300)
    create_car('Dodge', 'Ram', 2013, 23_000)
  end
end

feature 'Viewing Car' do
  scenario 'can view a car' do
    Car.create(make: 'Nissan', model: 'Xtera', year: 2010, price: 12_000)
    visit 'cars'

    expect(page).to have_content('Nissan')
    expect(page).to have_content('Xtera')
    expect(page).to have_content(2010)
    expect(page).to have_content(12_000)
  end
end

feature 'Editing Cars' do
  scenario 'can edit a car' do
    Car.create(id: 51, make: 'Nissan', model: 'Xtera', year: 2010, price: 12_000)
    visit '/cars/51'
    click_link 'Edit'

    fill_in 'Make', with: 'Subaru'
    fill_in 'Model', with: 'Outback'
    fill_in 'Year', with: 2005
    fill_in 'Price', with: 9_000

    click_button 'Update'

    expect(page).to have_content('Car was successfully updated.')
    expect(page).to have_content('Subaru')
    expect(page).to have_content('Outback')
    expect(page).to have_content(2005)
    expect(page).to have_content(9_000)
  end
end

def create_car(make, model, year, price)
  visit '/'

  click_link 'New Car'

  fill_in 'Make', with: make
  fill_in 'Model', with: model
  fill_in 'Year', with: year
  fill_in 'Price', with: price

  click_button 'Create Car'

  expect(page).to have_content(make)
  expect(page).to have_content(model)
  expect(page).to have_content(year)
  expect(page).to have_content(price)
end
