require 'twilio-ruby'
class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.search(params[:search]).paginate(:per_page => 2, :page => params[:page]) #.where(is_active: true)
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        configure_sms
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        configure_sms
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :contact_no, :email_address, :project_name, :identity_document, :identity_number, :employee_id, :expected_schedule, { category_ids:[] })
    end
   #this code enables us to send sms notification to clients 
    def configure_sms
#      @twilio_client = Twilio::REST::Client.new TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'], ssl_verify_peer: false
#      # Create and send an SMS message
#      @twilio_client.messages.create(
#        from: TWILIO_CONFIG['from'],
#        to: "+91#{@client.contact_no}",
#        body: "Hi.Your schedule is booked for #{@client.expected_schedule}. Please be on time.-Rezonance Creations(+919561150916)"
#      )
    end
end
