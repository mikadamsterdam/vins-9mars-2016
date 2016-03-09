require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :expert_name => "MyString",
      :review => "MyText",
      :rating => 1,
      :wine => nil
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "input#review_expert_name[name=?]", "review[expert_name]"

      assert_select "textarea#review_review[name=?]", "review[review]"

      assert_select "input#review_rating[name=?]", "review[rating]"

      assert_select "input#review_wine_id[name=?]", "review[wine_id]"
    end
  end
end
