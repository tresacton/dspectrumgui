require 'rails_helper'

RSpec.describe "captures/show", type: :view do
  before(:each) do
    @capture = assign(:capture, Capture.create!(
      :unit_id => 1,
      :device_id => 2,
      :name => "Name",
      :notes => "MyText",
      :binary => "MyText",
      :original_binary => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
