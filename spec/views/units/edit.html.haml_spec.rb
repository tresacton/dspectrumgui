require 'rails_helper'

RSpec.describe "units/edit", type: :view do
  before(:each) do
    @unit = assign(:unit, Unit.create!(
      :device_id => 1,
      :name => "MyString",
      :notes => "MyText"
    ))
  end

  it "renders the edit unit form" do
    render

    assert_select "form[action=?][method=?]", unit_path(@unit), "post" do

      assert_select "input#unit_device_id[name=?]", "unit[device_id]"

      assert_select "input#unit_name[name=?]", "unit[name]"

      assert_select "textarea#unit_notes[name=?]", "unit[notes]"
    end
  end
end
