require 'rails_helper'

RSpec.describe Section, type: :model do
	describe "Associations" do
		it { should belong_to(:device) }
	end

	describe "section range" do 
	  	subject { described_class.create(name:'section name', start_pos: 0, end_pos: 16) }
		it "correctly returns range object" do
			expect(subject.section_range).to eq(0..16)
		end
	end
end
