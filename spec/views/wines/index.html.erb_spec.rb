require 'rails_helper'

RSpec.describe "wines/index", type: :view do
  before(:each) do
    assign(:wines, [
      Wine.create!(
        :name => "Name",
        :description => "MyText",
        :origin => "Origin"
      ),
      Wine.create!(
        :name => "Name",
        :description => "MyText",
        :origin => "Origin"
      )
    ])
  end

  it "renders a list of wines" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Origin".to_s, :count => 2
  end
end
