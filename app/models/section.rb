class Section < ActiveRecord::Base
  belongs_to :device

  def section_range 
    start_pos..end_pos
  end

end
