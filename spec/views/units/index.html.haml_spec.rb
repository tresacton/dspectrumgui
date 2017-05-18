require 'rails_helper'

RSpec.describe "units/index", type: :view do
  before(:each) do
    assign(:units, [
      Unit.create!(
        :device_id => 1,
        :name => "Name",
        :notes => "MyText"
      ),
      Unit.create!(
        :device_id => 1,
        :name => "Name",
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of units" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
