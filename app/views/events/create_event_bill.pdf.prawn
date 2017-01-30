prawn_document( border: 'blue') do |pdf|
    #pdf.stroke_bounds
    pdf.move_down(5)
    pdf.draw_text @event.invoice_no , at: [450,755]
    pdf.draw_text "Date- " + @event.invoice_date.strftime("%d/%m/%Y"), at: [415,740]
    pdf.move_down(40)
    #image_path = Rails.root.join('app','assets','images','rezonance_bill_logo.png').to_s
    image_path = Rails.root.join('app','assets','images','aditya_birla.jpg').to_s
    pdf.image image_path, :width => 250, position: :center
    pdf.move_down(5)
    #pdf.text "Shop No. 5, Tulsani Heights, Walhekarwadi Road, Chinchwad, Pune - 33 ", align: :center
    #pdf.text "Contact: +91 956 115 0916", align: :center
    pdf.text "11/12 Thube Park, 16, Shivajinagar, Pune, Maharashtra 411005", align: :center
    pdf.text "Contact: 020 2899 9999", align: :center
    pdf.text "Email Id: sancheti@gmail.com", align: :center

    pdf.stroke_horizontal_rule
    pdf.move_down(5)
    pdf.draw_text "To. " + @event.bill_to_name, :at => [50,615], size: 10
    pdf.draw_text "" + @event.bill_to_address, :at => [65,600], size: 10
    pdf.move_down(50)

    collector = @event.particulars.each_with_index.collect { |particular, index| 
        detail = display_particulars particular.first, false
        [index+1, detail, particular.last ]
    }
    taxes = @event.tax.each.collect { |key, value| 
        collector.insert(-1,['', key, value ])
    }
    #collector.insert(-1,['', @event.tax.keys.to_s.gsub("["," ").gsub("]"," "), @event.tax.values.to_s.gsub("["," ").gsub("]"," ") ])
    collector.insert(0,["Sr. No.", "Particulars", "Amount"])
    
    collector.insert(-1,["", "Rupees #{@event.total.to_words.capitalize} only",  "Rs. #{@event.total}/-"])
    pdf.table(collector) do
        column(0).style(:size => 9)
        column(1).style(:size => 9, :width => 400)
        column(2).style(:size => 9, :width => 70)
        row(0).style(:background_color => 'dddddd', :size => 9, :align => :center, :font_style => :bold)
        row(-1).style(:size => 9, :align => :center, :font_style => :bold)
    end
#pdf.text "Inclusive of all taxes", align: :left, size: 9
    pdf.move_down(50)
    #pdf.text "For Rezonance Creations", align: :right, size: 12
    pdf.text "For Sancheti", align: :right, size: 12
    pdf.text "(Terms and Conditions apply)", align: :right, size: 9

end