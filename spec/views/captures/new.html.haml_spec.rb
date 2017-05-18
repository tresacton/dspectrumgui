require 'rails_helper'

RSpec.describe "captures/new", type: :view do
  before(:each) do
    assign(:capture, Capture.new(
      :unit_id => 1,
      :device_id => 1,
      :name => "MyString",
      :notes => "MyText",
      :binary => "MyText",
      :original_binary => "MyText"
    ))
  end

  it "renders new capture form" do
    render

    assert_select "form[action=?][method=?]", captures_path, "post" do

      assert_select "input#capture_unit_id[name=?]", "capture[unit_id]"

      assert_select "input#capture_device_id[name=?]", "capture[device_id]"

      assert_select "input#capture_name[name=?]", "capture[name]"

      assert_select "textarea#capture_notes[name=?]", "capture[notes]"

      assert_select "textarea#capture_binary[name=?]", "capture[binary]"

      assert_select "textarea#capture_original_binary[name=?]", "capture[original_binary]"
    end
  end
end
