require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the person view', type: :feature do

  let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }
  
  describe 'phone numbers' do
    before(:each) do
      person.phone_numbers.create(number: "555-1234")
      person.phone_numbers.create(number: "555-5678")
      visit person_path(person)
    end
  
  
    it 'shows the phone numbers' do
      person.phone_numbers.each do |phone|
        expect(page).to have_content(phone.number)
      end
    end

    it 'has links to edit phone numbers' do
      person.phone_numbers.each do |phone|
        expect(page).to have_link('edit', href: edit_phone_number_path(phone))
      end
    end
  end

  describe 'email addresses' do
    before(:each) do
      person.email_addresses.create(address: "foo@example.com")
      person.email_addresses.create(address: "bar@example.com")
      visit person_path(person)
    end
  
    it 'shows the email addresses' do
      person.email_addresses.each do |email|
        expect(page).to have_selector('li', text: email.address)
      end
    end
  
    it 'has an add email address link' do
      expect(current_path).to eq(person_path(person))
      click_on('new_email_address')
      expect(current_path).to eq(new_email_address_path)
    end
  end
end  