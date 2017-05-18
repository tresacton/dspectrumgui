require 'rails_helper'

RSpec.describe "units/new", type: :view do
  before(:each) do
    assign(:unit, Unit.new(
      :device_id => 1,
      :name => "MyString",
      :notes => "MyText"
    ))
  end

  it "renders new unit form" do
    render

    assert_select "form[action=?][method=?]", units_path, "post" do

      assert_select "input#unit_device_id[name=?]", "unit[device_id]"

      assert_select "input#unit_name[name=?]", "unit[name]"

      assert_select "textarea#unit_notes[name=?]", "unit[notes]"
    end
  end
end
