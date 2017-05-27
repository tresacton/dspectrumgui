require 'rails_helper'

RSpec.describe Capture, type: :model do  
	subject { described_class.new }

	describe "Associations" do
		it { should belong_to(:device) }
		it { should belong_to(:unit) }
	end

	describe "Invalid PWM 66/33 Capture" do 
	  	subject { described_class.new(binary: "1100100011001000",original_binary: "1100100011001000") }
		it "detects valid PWM 66/33" do
      		expect(subject.valid_pwm?).to eq(false)
		end
	end

	describe "Valid PWM 66/33 Capture" do 
	  	subject { described_class.new(binary: "110100110100",original_binary: "110100110100") }
		it "detects valid PWM 66/33" do
      		expect(subject.valid_pwm?).to eq(true)
		end
		it "decodes PWM 66/33"
	end
  
	it "detects valid PWM 75/25"
	it "decodes PWM 75/25"  
	it "flips the binary"
	it "checks for well aligned manchester symbols"
	it "checks for well off-by-one manchester symbols"
	it "decods manchester"
	it "transforms binary to hexcode"
	it "transforms binary to ascii"
	it "transforms arbitrarily supplied binary to hexcode"
end
