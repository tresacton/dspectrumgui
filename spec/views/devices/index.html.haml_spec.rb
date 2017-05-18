require 'rails_helper'

RSpec.describe "devices/index", type: :view do
  before(:each) do
    assign(:devices, [
      Device.create!(
        :fcc_id => "Fcc",
        :baudrate => "Baudrate",
        :frequency => 1.5,
        :modulation => "Modulation",
        :encoding => "Encoding",
        :name => "Name",
        :notes => "MyText"
      ),
      Device.create!(
        :fcc_id => "Fcc",
        :baudrate => "Baudrate",
        :frequency => 1.5,
        :modulation => "Modulation",
        :encoding => "Encoding",
        :name => "Name",
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of devices" do
    render
    assert_select "tr>td", :text => "Fcc".to_s, :count => 2
    assert_select "tr>td", :text => "Baudrate".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Modulation".to_s, :count => 2
    assert_select "tr>td", :text => "Encoding".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
