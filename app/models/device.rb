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


end
