require 'rails_helper'

RSpec.describe 'customer create' do
  it 'displays a link to create a new customer from the index page' do

    visit '/customers'

    click_link 'New Customer'
  end

  it 'provides a form to create a customer' do
    visit '/customers'
    click_link 'New Customer'
    fill_in 'customer[first_name]', with: 'Chaz'
    fill_in 'customer[last_name]', with: 'Simons'
    fill_in 'customer[address]', with: '1234 Cool Guy Lane'
    select "Yes", :from => "over_21"
    fill_in 'customer[rewards]', with: '1000'
    save_and_open_page
  end
end
