prawn_document() do |pdf|
#For the Colored Box
pdf.bounding_box([0, pdf.cursor], width: 520, height: 20) do
    pdf.stroke_color 'FFFFFF'
        pdf.stroke_bounds
        pdf.stroke do
            pdf.stroke_color 'FFFF00'
            pdf.fill_color '36DA5C'
            pdf.fill_and_stroke_rectangle [0,pdf.cursor], 520, 20
            pdf.fill_color '000000'
        end
end 
#End of colored box
pdf.move_down(20)
pdf.stroke_color '000000'
#pdf.text "Rezonance Creations", :size => 15, :style => :bold
pdf.text "Sancheti Hospital", :size => 15, :style => :bold
pdf.move_down(20)

#Add the address and Invoice number
pdf.define_grid(columns: 12, rows: 12)
pdf.grid(1).bounding_box do
  pdf.text "sometext hi" 
end
#End of address and Invoice number
pdf.stroke_horizontal_rule
#
#collector = [["BILL TO","INVOICE#"]]
    collector = @schedules.collect{ |schedule| [get_local_time(schedule.start_time).to_s, get_local_time(schedule.end_time).to_s, schedule.duration.to_s]}
	collector.insert(0,["Start Time", "End Time", "Duration"])
	collector.insert(-1,["", "Total Duration",  @complete_duration])
	collector.insert(-1,["Total Amount", "#{@complete_duration} * #{params[:rate]}",  @total_amount])

	pdf.table(collector)
end