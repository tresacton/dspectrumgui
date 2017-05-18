class Unit < ActiveRecord::Base
  belongs_to :device
  has_many :captures, dependent: :destroy


  def check_signals
    manchester_failures = {}
    captures.each do |cap|
      cap.original_binary.scan(/../).each do |pair|
        manchester_failures[pair]='invalid manchester' if (pair != "10") and (pair != "01")
      end
    end

    manchester_failures
  end


  def valid_manchester?
    check_signals.blank?
  end

  def manchester_decode
    symbols = ""
    captures.each do |cap|
      cap.original_binary.scan(/../).each do |s|
        puts s.to_i == 10
        symbols += '1' if s.to_i == 10
        symbols += '0' if s.to_i == 01
      end
    end
    symbols
  end

end
