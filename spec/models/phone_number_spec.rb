require 'spec_helper'

describe PhoneNumber do
  let(:phone_number) { PhoneNumber.new(number: "1112223333", person_id: 1) }
  it 'is valid' do
    expect(phone_number).to be_valid
  end
  
  it 'is invalid without a number' do
    phone_number.number = nil
    expect(phone_number).to_not be_valid
  end

  it 'must have a reference to a person' do
  	phone_number.person_id = nil
  	expect(phone_number).not_to be_valid
  end

  it 'is associated with a person' do
  	expect(phone_number).to respond_to(:person)
  end

#  it 'has a link to add a new phone number' do
#    expect(page).to have_link('Add phone number', href: new_phone_number_path(person_id: person.id))
#  end
#  it 'adds a new phone number' do
#    pending
#    page.click_link('Add phone number')
#    page.fill_in('Number', with: '555-8888')
#    page.click_button('Create Phone number')
#    expect(current_path).to eq(person_path(person))
#    expect(page).to have_content('555-8888')
#  end

end
