class Device < ActiveRecord::Base
  require 'csv'
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

  def update_modulation
    if (modulation == "OOK" && encoding == "n/a") || (modulation.blank? && encoding.blank?)
      if could_be_pwm?
        update_attribute(:modulation,"PWM")
        update_attribute(:encoding,"66/33")
      elsif could_be_pwm_7525?
        update_attribute(:modulation,"PWM")
        update_attribute(:encoding,"75/25")
      elsif could_be_manchester?
        update_attribute(:modulation,"OOK")
        update_attribute(:encoding,"Manchester")
      else
        update_attribute(:modulation,"OOK")
        update_attribute(:encoding,"n/a")
      end
    end
  end

  def format_frequency
    number_of_decimals = decimals(frequency)
    pad = 5 - number_of_decimals
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

  # export a section template
  def sections_to_csv template_name, added_by
    column_names = "name", "start_pos", "end_pos", "colour", "notes"

    the_csv = CSV.generate(headers: true) do |csv_text|
      csv_text << column_names
      sections.each do |section|
        csv_text << section.attributes.values_at(*column_names)
      end
    end
    the_csv.gsub('"',"'")
    open(Rails.root.join('mcs', 'contribution.md').to_s, 'w') {|f|
      f.puts "```ruby"
      f.puts "SectionTemplate.find_or_create_by(:name => \"#{template_name}\") do |st|"
      f.puts "  st.sections = \"#{the_csv}\" "
      f.puts "  st.added_by = '#{added_by}' "
      f.puts "end"
      f.puts "```"
    }
  end


end
