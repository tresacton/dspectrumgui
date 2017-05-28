class Unit < ActiveRecord::Base
  belongs_to :device
  has_many :captures, dependent: :destroy

end
