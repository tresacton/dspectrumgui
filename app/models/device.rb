class Device < ActiveRecord::Base
  has_many :units, dependent: :destroy
  has_many :captures
  has_many :sections

  def could_be_manchester?
    captures.map(&:valid_manchester?).any?
  end

  def could_be_pwm?
    captures.map(&:valid_pwm?).any?
  end

  def could_be_pwm_7525?
    captures.map(&:valid_pwm_7525?).any?
  end

  def format_frequency
    number_of_decimals = decimals(frequency)
    pad = 6 - number_of_decimals
    frequency.to_s.gsub(".","") + ("0"*pad)
  end

  def decimals(a)
    num = 0
    while(a != a.to_i)
        num += 1
        a *= 10
    end
    num   
end

end
