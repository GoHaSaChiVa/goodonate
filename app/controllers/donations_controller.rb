class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /donations
  # GET /donations.json
  respond_to :html
  def index
    
    if current_user
      if current_user.admin?
        @donations=Donation.all
        respond_with(@donations)
      else
         @user = current_user
         @donations =@user.donations.all
         respond_with(@donations)
      end
    else
    redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
        
  end
  
  def send_sms (to_number, message)
  account_sid = "AC6c5cd2bab9609d40a0aa1ec2c6603469"
  auth_token = "96d8bbe64d29b3eff19662d53bf9df24"
  client = Twilio::REST::Client.new account_sid, auth_token
   
  from = "+15719897726" # Your Twilio number
   client.account.messages.create(
    :from => from,
    :to => to_number,
    :body => message
  )
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
  end

  # GET /donations/new
  def new
    @donation = Donation.new
  end

  # GET /donations/1/edit
  def edit
  end
  

  # POST /donations
  # POST /donations.json
  def create
    @donation = Donation.new(donation_params)

    respond_to do |format|
      if @donation.save
        send_sms("+919502353699","Hello, greetings from Goodonate team. You have donation from #{current_user.name} garu. Donation details are - category is " + @donation.category + ", quantity is " + @donation.quantity.to_s + ", organization is " + @donation.organization.name + " address is  #{current_user.address}")
        format.html { redirect_to @donation, notice: 'Donation was successfully created.' }
        format.json { render :show, status: :created, location: @donation }
      else
        format.html { render :new }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donations/1
  # PATCH/PUT /donations/1.json
  def update
    respond_to do |format|
      if @donation.update(donation_params)
        format.html { redirect_to @donation, notice: 'Donation was successfully updated.' }
        format.json { render :show, status: :ok, location: @donation }
      else
        format.html { render :edit }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.json
  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to donations_url, notice: 'Donation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donation_params
      params.require(:donation).permit(:category, :quantity, :organization_id, :user_id)
    end
end
