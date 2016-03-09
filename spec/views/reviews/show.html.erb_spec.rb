require 'rails_helper'

RSpec.describe "reviews/show", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :expert_name => "Expert Name",
      :review => "MyText",
      :rating => 1,
      :wine => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Expert Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
