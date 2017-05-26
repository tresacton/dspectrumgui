SectionTemplate.find_or_create_by(:name => "Generic Wireless Alarm System") do |st|
st.sections = "name,start_pos,end_pos,colour,notes
Device ID,0,15,indigo,Changes between devices; static across functions. Must be device id. Recommend expressing this as an integer.
Function Code,16,23,darkgreen,Static between devices as long as same button is pressed. Must be the button. Lets call it the function code. Recommend expressing this as an integer.
Packet Terminator,24,24,gray,This bit is always 0 so far. We're just going to assume it's a packet terminator." 
st.added_by = 'nullwolf' 
end

