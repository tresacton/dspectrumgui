require 'rails_helper'

RSpec.describe "sections/index", type: :view do
  before(:each) do
    assign(:sections, [
      Section.create!(
        :device_id => 1,
        :name => "Name",
        :notes => "Notes",
        :start_pos => 2,
        :end_pos => 3,
        :colour => "Colour"
      ),
      Section.create!(
        :device_id => 1,
        :name => "Name",
        :notes => "Notes",
        :start_pos => 2,
        :end_pos => 3,
        :colour => "Colour"
      )
    ])
  end

  it "renders a list of sections" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Colour".to_s, :count => 2
  end
end
