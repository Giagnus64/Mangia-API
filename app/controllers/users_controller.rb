class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        new_user_params = user_params
        user = User.create(new_user_params)
        if(user.valid?)
            token = encode_token({user_id: user.id})
            userHash = user.as_json(only: [:id, :username])
            userHash[:token] = token
            render json: userHash, status: :created
        else
            render json: {messages: user.errors.full_messages}
        end
    end

    

    private

    def user_params 
        params.require(:user).permit(:username, :password)
    end

end
