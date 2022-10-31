class Api::V1::AddressesController < ApplicationController
        protect_from_forgery with: :null_session

        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    before_action :set_addresses, only: [:show, :update, :destroy]
    
    #before_action :require_authorization!, only: [:show, :update, :destroy]
    
    # GET /api/v1/addresses
    
    def index
    
    @addresses = Address.all
    
    render json:{ addresses: @addresses}
    
    end
    
    # GET /api/v1/addresses/1
    

    def show
    if @address == nil 
        render json: {message: 'Address não encontrado.'}
    else
        #render json: {addresses: @addresses}
    end
    end    
    
    # POST /api/v1/addresses
    
        def create
    
    @address = Address.new(addresses_params)

     if @address.save
    
        # render json: @address, status: :created
    
     else  
    
        render json: @address.errors, status: :unprocessable_entity
    
        end
    
    end
    
    # PATCH/PUT /api/v1/addresses/1
    
    def update
    
    if @addresses.update(addresses_params)
    
        render json: @addresses
    
    else
    
        render json: @addresses.errors, status: :unprocessable_entity
    
        end
    
    end
    
    # DELETE /api/v1/addresses/1
    
    def destroy
    
    @addresses.destroy
    
    end
    
    private
    
    # Use callbacks to share common setup or constraints between actions.
    
    def set_addresses
    
        @addresses = Address.find_by(id: params[:id])
        render json: {'messagem': 'addresses não encontrado'}, status: 200 unless @addresses.present?
        #render json: {'messagem': 'addresses não encontrado'}, status: 200 if  !@addresses.present?
        end
    
    # Only allow a trusted parameter "white list" through.
    
    def addresses_params
    
        params.require(:addresses).permit(:street, :number, :district, :zipcode, :city, :user_id)
    
    end
    
    #def require_authorization!
    
        # unless current_address == @addresses.address
    
        #  render json: {}, status: :forbidden
    
        # end
    end
