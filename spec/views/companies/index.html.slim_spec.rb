require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(name: 'Company LLC.'),
      Company.create!(name: 'Foo Inc.')
    ])
  end

  it "renders a list of companies" do
    render
    cell_selector = 'tr>td'
    expect(rendered).to have_selector(cell_selector, text: 'Company LLC.')
    expect(rendered).to have_selector(cell_selector, text: 'Foo Inc.')
  end
end
