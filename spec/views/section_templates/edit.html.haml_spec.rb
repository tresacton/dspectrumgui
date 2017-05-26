require 'rails_helper'

RSpec.describe "section_templates/edit", type: :view do
  before(:each) do
    @section_template = assign(:section_template, SectionTemplate.create!(
      :name => "MyString",
      :sections => "MyText",
      :added_by => "MyString"
    ))
  end

  it "renders the edit section_template form" do
    render

    assert_select "form[action=?][method=?]", section_template_path(@section_template), "post" do

      assert_select "input#section_template_name[name=?]", "section_template[name]"

      assert_select "textarea#section_template_sections[name=?]", "section_template[sections]"

      assert_select "input#section_template_added_by[name=?]", "section_template[added_by]"
    end
  end
end
