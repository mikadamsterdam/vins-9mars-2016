require 'rails_helper'

RSpec.describe "wines/show", type: :view do
  before(:each) do
    @wine = assign(:wine, Wine.create!(
      :name => "Name",
      :description => "MyText",
      :origin => "Origin"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Origin/)
  end
end
