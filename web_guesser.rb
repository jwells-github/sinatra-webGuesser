require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)
$background_color = "white"

get '/' do 
    guess = params["guess"]
    cheat = params["cheat"]
    message = check_guess(guess)
    erb :index, :locals => {:message => message, :background_color => $background_color, :cheat => cheat, :secret_number => SECRET_NUMBER}
end

def check_guess(guess)
        if params["guess"].to_i > SECRET_NUMBER && params["guess"].to_i <= SECRET_NUMBER + 5
            $background_color = "pink"
            "Too High"
        elsif params["guess"].to_i < SECRET_NUMBER && params["guess"].to_i >= SECRET_NUMBER - 5
             $background_color = "pink"
            "Too Low"
        elsif params["guess"].to_i < SECRET_NUMBER
            $background_color = "red"
            "Far too low"
        elsif params["guess"].to_i >  SECRET_NUMBER
            $background_color = "red"
            "Far too high"
        else
            $background_color = "green"
            "You got it right! The Secret Number is #{SECRET_NUMBER}"
        end
end