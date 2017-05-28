require 'rails_helper'

RSpec.describe Device, type: :model do
	######################
	# General
	######################


	describe "Associations" do
		it { should have_many(:units) }
		it { should have_many(:captures) }
		it { should have_many(:sections) }
	end

	describe "format frequency" do 
	  	subject { described_class.create(name:'device name', frequency: 433.0) }
		it "correctly formats 433 mhz" do
			expect(subject.format_frequency).to eq("4330000000")
		end
	end

	describe "format frequency" do 
	  	subject { described_class.create(name:'device name', frequency: 1433.0) }
		it "correctly formats 1.433 ghz" do
			expect(subject.format_frequency).to eq("14330000000")
		end
	end

	describe "format frequency" do 
	  	subject { described_class.create(name:'device name', frequency: 43.0) }
		it "correctly formats 43 mhz" do
			expect(subject.format_frequency).to eq("430000000")
		end
	end

	describe "sharing templates" do 
	  	subject { described_class.create(name:'device name') }
		it "correctly exports sections as csv" do
			section = Section.create(name: "name", start_pos: 0, end_pos: 15, colour: 'blue', notes: 'none', device_id: subject.id)  
			puts subject.sections_to_csv('template','nobody')
			expect(subject.sections_to_csv('template','nobody')).to eq("```ruby\nSectionTemplate.find_or_create_by(:name => \"template\") do |st|\n  st.sections = \"name,start_pos,end_pos,colour,notes\nname,0,15,blue,none\n\" \n  st.added_by = 'nobody' \nend\n```\n")
		end
	end

	######################
	# Update Modulation
	######################

	describe "update modulation" do 
	  	subject { described_class.create(name:'device name') }
		it "correctly updates as PWM 6633" do
			unit = Unit.create(name: "name", device_id: subject.id)  
			capture = Capture.create(binary: "110100100",original_binary: "110100100", name: "name", device_id: subject.id, unit_id: unit.id)  
			subject.update_modulation
      		expect(subject.modulation).to eq("PWM")
      		expect(subject.encoding).to eq("66/33")
		end
	end
	describe "update modulation" do 
	  	subject { described_class.create(name:'device name') }
		it "correctly updates as PWM 7525" do
			unit = Unit.create(name: "name", device_id: subject.id)  
			capture = Capture.create(binary: "1110100011101000",original_binary: "1110100011101000", name: "name", device_id: subject.id, unit_id: unit.id)  
			subject.update_modulation
      		expect(subject.modulation).to eq("PWM")
      		expect(subject.encoding).to eq("75/25")
		end
	end
	describe "update modulation" do 
	  	subject { described_class.create(name:'device name') }
		it "correctly updates as Manchester" do
			unit = Unit.create(name: "name", device_id: subject.id)  
			capture = Capture.create(binary: "10100101",original_binary: "10100101", name: "name", device_id: subject.id, unit_id: unit.id)  
			subject.update_modulation
      		expect(subject.modulation).to eq("OOK")
      		expect(subject.encoding).to eq("Manchester")
		end
	end
	describe "update modulation" do 
	  	subject { described_class.create(name:'device name') }
		it "correctly updates as OOK if nothing else" do
			unit = Unit.create(name: "name", device_id: subject.id)  
			capture = Capture.create(binary: "1111001010111",original_binary: "1111001010111", name: "name", device_id: subject.id, unit_id: unit.id)  
			subject.update_modulation
      		expect(subject.modulation).to eq("OOK")
      		expect(subject.encoding).to eq("n/a")
		end
	end
	describe "update modulation" do 
	  	subject { described_class.create(name:'device name', modulation: "OOK", encoding: "n/a") }
		it "is run if encoding and modulation match our OOK update" do
			unit = Unit.create(name: "name", device_id: subject.id)  
			capture = Capture.create(binary: "10100101",original_binary: "10100101", name: "name", device_id: subject.id, unit_id: unit.id)  
			subject.update_modulation
      		expect(subject.modulation).to eq("OOK")
      		expect(subject.encoding).to eq("Manchester")
		end
	end
	describe "update modulation" do 
	  	subject { described_class.create(name:'device name', modulation: "ASK", encoding: "Foobar") }
		it "should not run if encoding and modulation are custom" do
			unit = Unit.create(name: "name", device_id: subject.id)  
			capture = Capture.create(binary: "10100101",original_binary: "10100101", name: "name", device_id: subject.id, unit_id: unit.id)  
			subject.update_modulation
      		expect(subject.modulation).to eq("ASK")
      		expect(subject.encoding).to eq("Foobar")
		end
	end

end
