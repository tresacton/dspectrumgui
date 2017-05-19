class Capture < ActiveRecord::Base
  belongs_to :unit
  belongs_to :device


  def flip bin
    flipped = ""
    bin.scan(/./).each do |b|
      b == '1' ? flipped << '0' : flipped << '1'
    end
    flipped
  end

  def check_signals shift=false
    if shift
      manchester_failures = {}
      shifted_bin = '0' << original_binary
      shifted_bin.scan(/../).each do |pair|
        manchester_failures[pair]='invalid manchester' if (pair != "10") and (pair != "01")
      end
    else
      manchester_failures = {}
      original_binary.scan(/../).each do |pair|
        manchester_failures[pair]='invalid manchester' if (pair != "10") and (pair != "01")
      end
    end
    manchester_failures
  end

  def pwm_decode # 66/33
    # 66/33 Format PWM
    symbols = ""
    the_bin = original_binary
    while ((the_bin.size % 3) != 0)
      the_bin+='0'
      puts "adding 0"
      puts the_bin
    end
    the_bin.scan(/.../).each do |s|
      # 100 == 0
      # 110 == 1
      symbols << "1" && puts("#{s} is 1") if s.to_i == 110
      symbols << "0" && puts("#{s} is 0") if s.to_i == 100
    end
    symbols
  end

  def pwm_decode_7525
    # 66/33 Format PWM
    symbols = ""
    the_bin = original_binary
    while ((the_bin.size % 3) != 0)
      the_bin+='0'
      puts "adding 0"
      puts the_bin
    end
    the_bin.scan(/..../).each do |s|
      # 100 == 0
      # 110 == 1
      symbols << "1" && puts("#{s} is 1") if s.to_i == 1110
      symbols << "0" && puts("#{s} is 0") if s.to_i == 1000
    end
    symbols
  end


  def valid_pwm? human=false

    pwm_errors = {}
    the_bin = original_binary

    while ((the_bin.size % 3) != 0)
      the_bin+='0'
      puts "adding 0"
      puts the_bin
    end
    the_bin.scan(/.../).each do |set|
      pwm_errors[set]='invalid pwm' if (set != "110") and (set != "100")
    end

    if human == false
      return pwm_errors.blank?
    else
      response = ""
      if pwm_errors.blank?
        response = "Yes"
      elsif pwm_errors.present?
        response << "No"
      end

      response
    end
  end

  def valid_pwm_7525? human=false

    pwm_errors = {}
    the_bin = original_binary


    if ((the_bin.size % 4) != 0)
      
      pwm_errors[the_bin.last]='incomplete pwm'  
      while ((the_bin.size % 4) != 0)
        the_bin+='0'
        puts "adding 0"
        puts the_bin
      end
    end

    the_bin.scan(/..../).each do |set|
      pwm_errors[set]='invalid pwm' if (set != "1110") and (set != "1000")
    end

  

    message = nil
    if pwm_errors.present?
      if pwm_errors.count == 1
        if pwm_errors.first[1] == 'incomplete pwm'
          message = "Valid PWM if padding at end was captured. Re-capture with padding and delete this item for best results."
        end 
      end
    end


    if human == false
      return pwm_errors.blank?
    else
      response = ""
      if pwm_errors.blank?
        response = "Yes"
      elsif pwm_errors.present?
        if message.blank?
          response << "No"
        else
          response << message
        end
      end

      response
    end
  end


  def manchester_decode
    symbols = ""
    original_binary.scan(/../).each do |s|
      symbols += '1' if s.to_i == 10
      symbols += '0' if s.to_i == 01
    end
    symbols
  end

  def valid_manchester? human=false
    if human == false
      check_signals.blank?
    else
      response = ""
      if check_signals.blank? then
        response = "Yes"
      else
        check_signals(shift=true).blank? ? response << "\n If you add a 0 at the start it is..." : response << "No"
      end

      response
    end
  end

  def to_hexcode bin=nil
    hex = ''
    f_hex = '\x'
    if bin
      hex << '%02x' % bin.to_i(2)
      f_hex << hex.scan(/.{2}|.+/).join('\x')
    else
      hex << '%02x' % original_binary.to_i(2)
      f_hex << hex.scan(/.{2}|.+/).join('\x')
    end
    f_hex
  end

  def to_ascii manchester=false, pwm=false
    if manchester
      f_hex = to_hexcode manchester_decode.gsub("\\x","")
      "#{f_hex.gsub(/../) { |pair| pair.hex.chr }}".force_encoding(Encoding::UTF_8).encode('utf-8', :invalid=>:replace, :replace=>"?")
    elsif pwm
      f_hex = to_hexcode pwm_decode.gsub("\\x","")
      "#{f_hex.gsub(/../) { |pair| pair.hex.chr }}".force_encoding(Encoding::UTF_8).encode('utf-8', :invalid=>:replace, :replace=>"?")
    else
      f_hex = to_hexcode
      "#{f_hex.gsub(/../) { |pair| pair.hex.chr }}".force_encoding(Encoding::UTF_8).encode('utf-8', :invalid=>:replace, :replace=>"?")
    end
  end

  def bin_to_ascii bin
    f_hex = to_hexcode bin
    "#{f_hex.gsub(/../) { |pair| pair.hex.chr }}".force_encoding(Encoding::UTF_8).encode('utf-8', :invalid=>:replace, :replace=>"?")
  end

  def shift_right
    update_attribute(:binary, binary.scan(/\w/).unshift('p'))
    save
  end

  def shift_left
    if binary.scan(/\w/).first == 'p'
      update_attribute(:binary, binary.scan(/\w/).drop(1))
      save
    end
  end

  def self.to_hexcode bin
    hex = ''
    f_hex = '\x'
    hex << '%02x' % bin.to_i(2)
    f_hex << hex.scan(/.{2}|.+/).join('\x')
    

    if f_hex.split("\\x").last.size == 1
      f_hex << "0"
    end
    f_hex
  end

end
