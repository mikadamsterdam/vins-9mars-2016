require 'rails_helper'

RSpec.describe "wines/new", type: :view do
  before(:each) do
    assign(:wine, Wine.new(
      :name => "MyString",
      :description => "MyText",
      :origin => "MyString"
    ))
  end

  it "renders new wine form" do
    render

    assert_select "form[action=?][method=?]", wines_path, "post" do

      assert_select "input#wine_name[name=?]", "wine[name]"

      assert_select "textarea#wine_description[name=?]", "wine[description]"

      assert_select "input#wine_origin[name=?]", "wine[origin]"
    end
  end
end
