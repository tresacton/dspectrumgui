class Cons 
  # this isn't an active record model. it's soley here to help with console commands for usability

  def self.live_capture_seed_file device_id, unit_id, capture_name, stop_at_first=false
     
    first_bin = ""
    last_bin = ""

    d = Device.find device_id
    u = Unit.find unit_id

    loop.with_index do |_, i| 
      c = Capture.new
      c.unit_id = u.id
      c.device_id = d.id
      c.name = "#{capture_name} - #{i+1}"
      until !c.new_record?
        bin = `cat "#{Rails.root}/tmp/test_change.tmp"`
        if bin.to_s != last_bin
          break if (bin.to_s == first_bin) && (stop_at_first == true)
          c.original_binary = bin.to_s
          c.binary = c.original_binary
          c.save
          last_bin = c.original_binary
        end
      end





    end

  end

end
