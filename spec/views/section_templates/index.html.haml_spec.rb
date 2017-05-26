require 'rails_helper'

RSpec.describe "section_templates/index", type: :view do
  before(:each) do
    assign(:section_templates, [
      SectionTemplate.create!(
        :name => "Name",
        :sections => "MyText",
        :added_by => "Added By"
      ),
      SectionTemplate.create!(
        :name => "Name",
        :sections => "MyText",
        :added_by => "Added By"
      )
    ])
  end

  it "renders a list of section_templates" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Added By".to_s, :count => 2
  end
end
