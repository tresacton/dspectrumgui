require 'rails_helper'

RSpec.describe "section_templates/show", type: :view do
  before(:each) do
    @section_template = assign(:section_template, SectionTemplate.create!(
      :name => "Name",
      :sections => "MyText",
      :added_by => "Added By"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Added By/)
  end
end
