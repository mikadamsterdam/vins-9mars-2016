require 'rails_helper'

RSpec.describe "wines/edit", type: :view do
  before(:each) do
    @wine = assign(:wine, Wine.create!(
      :name => "MyString",
      :description => "MyText",
      :origin => "MyString"
    ))
  end

  it "renders the edit wine form" do
    render

    assert_select "form[action=?][method=?]", wine_path(@wine), "post" do

      assert_select "input#wine_name[name=?]", "wine[name]"

      assert_select "textarea#wine_description[name=?]", "wine[description]"

      assert_select "input#wine_origin[name=?]", "wine[origin]"
    end
  end
end
