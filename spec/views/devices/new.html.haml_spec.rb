require 'rails_helper'

RSpec.describe "devices/new", type: :view do
  before(:each) do
    assign(:device, Device.new(
      :fcc_id => "MyString",
      :baudrate => "MyString",
      :frequency => 1.5,
      :modulation => "MyString",
      :encoding => "MyString",
      :name => "MyString",
      :notes => "MyText"
    ))
  end

  it "renders new device form" do
    render

    assert_select "form[action=?][method=?]", devices_path, "post" do

      assert_select "input#device_fcc_id[name=?]", "device[fcc_id]"

      assert_select "input#device_baudrate[name=?]", "device[baudrate]"

      assert_select "input#device_frequency[name=?]", "device[frequency]"

      assert_select "input#device_modulation[name=?]", "device[modulation]"

      assert_select "input#device_encoding[name=?]", "device[encoding]"

      assert_select "input#device_name[name=?]", "device[name]"

      assert_select "textarea#device_notes[name=?]", "device[notes]"
    end
  end
end
