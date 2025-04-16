require 'rails_helper'

RSpec.describe 'Listing companies', type: :feature do
  before do
    Company.create(
      name: 'Company LLC.',
    )
  end

  scenario 'with valid users' do
    visit companies_path

    aggregate_failures do
      expect(page).to have_content('Company LLC.')
    end
  end

  scenario 'New company', type: :feature do
    visit new_company_path

    expect(page).to have_field :company_name
  end

end
