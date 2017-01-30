class EventsController < ApplicationController
  include InvoiceEvents
  def event_bill
    @event = Event.new
    @invoice = Invoice.new
  end

  def create_event_bill
    if params[:id]
      set_event_params
    else
      @event = Event.new(event_params)
      particulars = params["event"]["particulars"]
      tax = params["event"]["tax"]
      @event.particulars =  Hash[*particulars] if particulars
      @event.tax =  get_tax_hash(tax) if tax
      @event.total = calculate_total
      @event.invoice_no = calculate_invoice
      @event.save
      create_invoice_details
    end
  end
  
  def show
    set_event_params
  end
  
  def index
    @events = Event.search(params[:search])
  end
  private 
  def event_params
    params.require(:event).permit(:invoice_date, :bill_to_name, :bill_to_address, :category, :particulars, :tax)
  end
  def set_event_params
    @event = Event.find(params[:id])
  end
  def calculate_total
    costing = @event.particulars.values.map(&:to_f).inject(:+)
    if @event.tax.nil?
      @event.break_up_costing = "#{costing}"
      return costing 
    end
    service_tax_amount, education_cess_tax_amount, krishi_kalyan_cess_tax_amount = get_breakup(costing)
    costing = (costing + service_tax_amount + education_cess_tax_amount + krishi_kalyan_cess_tax_amount).round
  end
  #this helps to maintian the serial for bill/quotation no.
  def calculate_invoice
    @event.category == "bill" ?  "Bill-#{Time.now.strftime("%Y")}/1" : "Quotation-#{Time.now.strftime("%Y")}/1"
  end
  
  def create_invoice_details
    @invoice = Invoice.new({category: @event.category, year: Time.now.strftime("%Y").to_i, event_id: @event.id})
    @invoice.invoice_identifier = calculate_invoice_identifier
    @invoice.save
  end
  #tracks the serial no. for bill/quotation
  def calculate_invoice_identifier
    invoice_array = Invoice.where(year: Time.now.strftime("%Y").to_i, category: @event.category)
    return 1 if invoice_array.empty?
    latest_identifier = invoice_array.last.invoice_identifier
    latest_identifier + 1
  end
end
