class UsersController < ApplicationController

    def create
        new_user_params = user_params
        user = User.create(new_user_params)
        if(user.valid?)
            userHash = user.as_json()
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
