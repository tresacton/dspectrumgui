class AddFlipPwmToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :flip_pwm, :boolean
  end
end
