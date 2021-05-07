class NomineesController < ApplicationController
    def index
        if logged_in?
            nominees = current_user.nominees
            render json: nominees
        else
            render :json => {
                error: "You need to log in to view this"
            }
        end
    end
end