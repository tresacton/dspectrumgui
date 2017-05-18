require 'rails_helper'

RSpec.describe "sections/edit", type: :view do
  before(:each) do
    @section = assign(:section, Section.create!(
      :device_id => 1,
      :name => "MyString",
      :notes => "MyString",
      :start_pos => 1,
      :end_pos => 1,
      :colour => "MyString"
    ))
  end

  it "renders the edit section form" do
    render

    assert_select "form[action=?][method=?]", section_path(@section), "post" do

      assert_select "input#section_device_id[name=?]", "section[device_id]"

      assert_select "input#section_name[name=?]", "section[name]"

      assert_select "input#section_notes[name=?]", "section[notes]"

      assert_select "input#section_start_pos[name=?]", "section[start_pos]"

      assert_select "input#section_end_pos[name=?]", "section[end_pos]"

      assert_select "input#section_colour[name=?]", "section[colour]"
    end
  end
end
