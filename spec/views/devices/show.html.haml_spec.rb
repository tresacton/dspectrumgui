require 'rails_helper'

RSpec.describe "devices/show", type: :view do
  before(:each) do
    @device = assign(:device, Device.create!(
      :fcc_id => "Fcc",
      :baudrate => "Baudrate",
      :frequency => 1.5,
      :modulation => "Modulation",
      :encoding => "Encoding",
      :name => "Name",
      :notes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Fcc/)
    expect(rendered).to match(/Baudrate/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Modulation/)
    expect(rendered).to match(/Encoding/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
