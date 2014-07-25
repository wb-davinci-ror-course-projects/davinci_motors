require "rails_helper"

feature "Creating Cars" do
  scenario "can create a car" do
    visit '/'

    pending("Friday")
    2.times do
    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    expect(page).to have_content('Car has been created.')
    expect(page).to have_content(Car.first.price)
    end
  end
end

feature "Viewing Car" do
  scenario "can view a car" do
    Car.create(make: 'Nissan', model: 'Xtera', year: 2010, price: 12000)
    visit 'cars'

    expect(page).to have_content('Nissan')
    expect(page).to have_content('Xtera')
    expect(page).to have_content('2010')
    expect(page).to have_content('12000')
  end
end

feature "Editing Cars" do
  scenario "can edit a car" do
    visit '/'
    click_link 'Edit'

    fill_in 'Make', with: 'Subaru'
    fill_in 'Model', with: 'Outback'
    fill_in 'Year', with: '2005'
    fill_in 'Price', with: '9000'

    click_button 'Update'

    expect(page).to have_content('Car was successfully updated.')
    expect(page).to have_content('Subaru')
    expect(page).to have_content('Outback')
    expect(page).to have_content(2005)
    expect(page).to have_content(9000)
  end
end

