class InvoicesController < ApplicationController
  include InvoiceEvents
  #to get the break up costing when the total cost is given as input
  def show_break_up
    @event = Event.new
    tax = params["event"]["tax"]
    @event.tax = get_tax_hash(tax) if tax
    total = params[:total_amount].to_f
    division_parameter = @event.tax ? get_division_parameter() : 1
    basic_amount = (total/division_parameter).round(2)
    service_tax_amount, education_cess_tax_amount, krishi_kalyan_cess_tax_amount = get_breakup(basic_amount)
    @break_up = "#{basic_amount}/#{service_tax_amount}/#{education_cess_tax_amount}/#{krishi_kalyan_cess_tax_amount}"
  end
  
  private 
  def event_params
    params.require(:event).permit(:invoice_date, :bill_to_name, :bill_to_address, :category, :particulars, :tax)
  end
  def get_division_parameter
    division_parameter = 1
    @event.tax.values.each do |tax_value|
        division_parameter += (tax_value.chop.to_f/100)
    end
    division_parameter.round(4)
  end
  def get_tax_hash(tax)
    tax_hash = {}
    tax.each do |component|
        component_content = component.split("(")
        tax_hash.merge!({component_content.first => component_content.last.chop})
    end
    tax_hash
  end
end
