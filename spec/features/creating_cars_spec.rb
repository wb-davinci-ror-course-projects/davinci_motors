require 'rails_helper'

feature 'Creating Cars' do
  scenario 'can create a car' do

    car_1 = FactoryGirl.create(:car)
    create_car_test(car_1)

    car_2 = FactoryGirl.create(:car)
    create_car_test(car_2)
  end
end

feature 'Viewing Car' do
  scenario 'can view a car' do

  car = FactoryGirl.create(:car)

    visit 'cars'

    expect(page).to have_content(car.make)
    expect(page).to have_content(car.model)
    expect(page).to have_content(car.year)
    expect(page).to have_content(car.price)
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

def create_car_test(car)
  visit '/'

  click_link 'New Car'

  fill_in 'Make', with: car.make
  fill_in 'Model', with: car.model
  fill_in 'Year', with: car.year
  fill_in 'Price', with: car.price

  click_button 'Create Car'

  expect(page).to have_content("#{car.year} #{car.make} #{car.model} created")
  expect(page).to have_content(car.make)
  expect(page).to have_content(car.model)
  expect(page).to have_content(car.year)
  expect(page).to have_content(car.price)
end
