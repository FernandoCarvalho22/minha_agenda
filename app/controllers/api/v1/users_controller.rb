class Api::V1::UsersController < ApplicationController
        protect_from_forgery with: :null_session

        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    before_action :set_user, only: [:show, :update, :destroy]
    
    #before_action :require_authorization!, only: [:show, :update, :destroy]
    
    # GET /api/v1/users
    
    def index
    
    @users = User.all
    
    render json:{ users: @users}
    
    end
    
    # GET /api/v1/users/1
    

    def show
        if @user == nil 
            render json: {message: 'User não encontrado.'}
        # else
            # render json: {user: @user}
        end
    end    
    
    # POST /api/v1/users
    
        def create
    
    @user = User.new(users_params)

    if @user.save
    
        #render json: @user, status: :created
    
    else
    
        render json: @user.errors, status: :unprocessable_entity
    
        end
    
    end
    
    # PATCH/PUT /api/v1/users/1
    
    def update
    
    if @user.update(users_params)
    
        render json: @user
    
    else
    
        render json: @user.errors, status: :unprocessable_entity
    
        end
    
    end
    
    # DELETE /api/v1/users/1
    
    def destroy
    
    @user.destroy
    
    end
    
    private
    
    # Use callbacks to share common setup or constraints between actions.
    
    def set_user
    
        @user = User.find_by(id: params[:id])
        render json: {'messagem': 'users não encontrado'}, status: 200 unless @user.present?
        #render json: {'messagem': 'users não encontrado'}, status: 200 if  !@users.present?
        end
    
    # Only allow a trusted parameter "white list" through.
    
    def users_params
    
        params.require(:user).permit(:name, :email, :cpf, :id)
    
    end
    
    #def require_authorization!
    
        # unless current_user == @users.user
    
        #  render json: {}, status: :forbidden
    
        # end
    end
