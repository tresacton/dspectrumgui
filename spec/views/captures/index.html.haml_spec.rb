require 'rails_helper'

RSpec.describe "captures/index", type: :view do
  before(:each) do
    assign(:captures, [
      Capture.create!(
        :unit_id => 1,
        :device_id => 2,
        :name => "Name",
        :notes => "MyText",
        :binary => "MyText",
        :original_binary => "MyText"
      ),
      Capture.create!(
        :unit_id => 1,
        :device_id => 2,
        :name => "Name",
        :notes => "MyText",
        :binary => "MyText",
        :original_binary => "MyText"
      )
    ])
  end

  it "renders a list of captures" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
