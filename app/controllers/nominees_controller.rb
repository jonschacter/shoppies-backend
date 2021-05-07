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

    def create
        nominee = Nominee.new(nominee_params)

        if nominee.save
            render json: nominee
        else
            render :json => {
                error: nominee.errors.full_messages.to_sentence
            }
        end
    end

    def destroy
        nominee = current_user.nominees.find_by(imdbID: params[:imdbID])
        if nominee
            nominee.destroy
            render :json => {
                notice: "Nominee successfully delete"
            }
        else
            render :json => {
                error: "Nominee could not be found"
            }
        end
    end
    
    private

    def nominee_params
        params.require(:nominee).permit(:imdbID, :user_id)
    end
end