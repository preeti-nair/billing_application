module InvoiceEvents
  #Calculate the total cost with the taxes
  def get_breakup(costing)
    service_tax_amount = @event.tax["Service Tax"].nil? ? 0 : (costing*@event.tax["Service Tax"].to_f)/100
    education_cess_tax_amount = @event.tax["Swachh Bharat cess"].nil? ? 0 : (costing*@event.tax["Swachh Bharat cess"].to_f)/100
    krishi_kalyan_cess_tax_amount = @event.tax["Krishi Kalyan Cess"].nil? ? 0 : (costing*@event.tax["Krishi Kalyan Cess"].to_f)/100
    @event.break_up_costing = "#{costing}/#{service_tax_amount}/#{education_cess_tax_amount}/#{krishi_kalyan_cess_tax_amount}}"
    return service_tax_amount.round(2), education_cess_tax_amount.round(2), krishi_kalyan_cess_tax_amount.round(2)
  end
  #convert the taxes from array to key-value
  def get_tax_hash(tax)
    tax_hash = {}
    tax.each do |component|
        component_content = component.split("(")
        tax_hash.merge!({component_content.first => component_content.last.chop})
    end
    tax_hash
  end
end