class Api::V1::ContatosController < ApplicationController
    protect_from_forgery with: :null_session

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :set_contato, only: [:show, :update, :destroy]
 
  #before_action :require_authorization!, only: [:show, :update, :destroy]
 
 # GET /api/v1/contatos
 
 def index
 
   @contatos = Contato.all
 
   render json: @contatos
 
 end
 
 # GET /api/v1/contatos/1
 

 def show
   if @contato == nil 
    render json: {message: 'Contato não encontrado.'}
   else
    render json: {contato: @contato}
   end
 end    
 
 # POST /api/v1/contatos
 
    def create
 
   @contato = Contato.new(contato_params)

   if @contato.save
 
     render json: @contato, status: :created
 
   else
 
     render json: @contato.errors, status: :unprocessable_entity
 
    end
 
 end
 
 # PATCH/PUT /api/v1/contatos/1
 
 def update
 
   if @contato.update(contato_params)
 
     render json: @contato
 
   else
 
     render json: @contato.errors, status: :unprocessable_entity
 
    end
 
 end
 
 # DELETE /api/v1/contatos/1
 
 def destroy
 
   @contato.destroy
 
 end
 
 private
 
   # Use callbacks to share common setup or constraints between actions.
 
   def set_contato
 
     @contato = Contato.find_by(id: params[:id])
     render json: {'messagem': 'contato não encontrado'}, status: 200 unless @contato.present?
     #render json: {'messagem': 'contato não encontrado'}, status: 200 if  !@contato.present?
    end
 
   # Only allow a trusted parameter "white list" through.
 
   def contato_params
 
    params.require(:contato).permit(:nome, :telefone, :email, :anotacao, :nome_mae)
 
   end
 
   #def require_authorization!
 
    # unless current_user == @contato.user
 
     #  render json: {}, status: :forbidden
 
     # end
 
   
end
