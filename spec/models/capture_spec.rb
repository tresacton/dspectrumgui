require 'rails_helper'

RSpec.describe Capture, type: :model do  
	subject { described_class.new }

	describe "Associations" do
		it { should belong_to(:device) }
		it { should belong_to(:unit) }
	end



	######################
	# PWM 6633
	######################

	describe "Invalid PWM 66/33" do 
	  	subject { described_class.new(binary: "1100100011001000",original_binary: "1100100011001000") }
		it "is reported as invalid" do
      		expect(subject.valid_pwm?).to eq(false)
		end
	end

	describe "Valid PWM 66/33" do 
	  	subject { described_class.new(binary: "110100110100",original_binary: "110100110100") }
		it "is reported as valid" do
      		expect(subject.valid_pwm?).to eq(true)
		end
		it "decodes PWM 66/33"
	end

	describe "Incomplete PWM 66/33" do 
	  	subject { described_class.new(binary: "1101001101",original_binary: "1101001101") }
		it "s padded with 0s and saved" do
      		expect(subject.valid_pwm?).to eq(true)
		end
	end


	describe "Incomplete PWM 66/33" do 
	  	subject { described_class.new(binary: "1101001101",original_binary: "1101001101") }
		it "is padded with 0s and saved with message for human on first reload" do
      		expect(subject.valid_pwm?(true)).to eq("This was valid PWM but significant whitespace at the end was missed by you. I have added 0s to the end and saved the change.")
		end
	end


	describe "Incomplete PWM 66/33" do 
	  	subject { described_class.new(binary: "1101001101",original_binary: "1101001101") }
		it "should return as valid on second reload" do
      		subject.valid_pwm?(true)
      		expect(subject.valid_pwm?(true)).to eq("Yes")
		end
	end

  	describe "Shifted Dr Nick Edge case PWM 66/33" do
  		subject { described_class.new(binary: "0110100110100",original_binary: "0110100110100") }
  		it "should detect and correct shift" do
      		expect(subject.valid_pwm?(true)).to eq("This is likely to be a PWM capture but there was an unexpected '0' at the beginning which suggests the last cell was also chopped off. It is STRONGLY recommended that you re-create this capture but this time start one cell later, and add an extra cell at the end even if it is empty. This is an edge-case that seems to occur rarely with rtl-sdr captures. We don't know why exactly.")
  		end
  	end


	######################
	# PWM 7725
	######################

	describe "Invalid PWM 75/25" do 
	  	subject { described_class.new(binary: "110100110100",original_binary: "110100110100") }
		it "is reported as invalid" do
      		expect(subject.valid_pwm_7525?).to eq(false)
		end
	end

	describe "Valid PWM 75/25" do 
	  	subject { described_class.new(binary: "1110100011101000",original_binary: "1110100011101000") }
		it "is reported as valid" do
      		expect(subject.valid_pwm_7525?).to eq(true)
		end
		it "decodes PWM 66/33"
	end


	describe "Incomplete PWM 75/25" do 
	  	subject { described_class.new(binary: "11101000111010",original_binary: "11101000111010") }
		it "is padded with 0s and saved" do
      		expect(subject.valid_pwm_7525?).to eq(true)
		end
	end


	describe "Incomplete PWM 75/25" do 
	  	subject { described_class.new(binary: "11101000111010",original_binary: "11101000111010") }
		it "is padded with 0s and saved with message for human on first reload" do
      		expect(subject.valid_pwm_7525?(true)).to eq("This was valid PWM but significant whitespace at the end was missed by you. I have added 0s to the end and saved the change.")
		end
	end


	describe "Incomplete PWM 75/25" do 
	  	subject { described_class.new(binary: "11101000111010",original_binary: "11101000111010") }
		it "should return as valid on second reload" do
      		subject.valid_pwm_7525?(true)
      		expect(subject.valid_pwm_7525?(true)).to eq("Yes")
		end
	end


  	describe "Shifted Dr Nick Edge case PWM 75/25" do
  		subject { described_class.new(binary: "01000111010001110",original_binary: "01000111010001110") }
  		it "should detect and correct shift" do
      		expect(subject.valid_pwm_7525?(true)).to eq("This is likely to be a PWM capture but there was an unexpected '0' at the beginning which suggests the last cell was also chopped off. It is STRONGLY recommended that you re-create this capture but this time start one cell later, and add an extra cell at the end even if it is empty. This is an edge-case that seems to occur rarely with rtl-sdr captures. We don't know why exactly.")
  		end
  	end
  









	it "flips the binary"
	it "checks for well aligned manchester symbols"
	it "checks for well off-by-one manchester symbols"
	it "is ook if its nothing else"
	it "decods manchester"
	it "transforms binary to hexcode"
	it "transforms binary to ascii"
	it "transforms arbitrarily supplied binary to hexcode"
end
