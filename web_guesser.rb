require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

get '/' do
  guess = params['guess'].to_i
  message = if params['guess']
              check_guess(guess, number)
            else
              "enter guess"
            end
  erb :index, :locals => {:number => number, :message => message, :guess => params['guess'].to_i }
end

def check_guess(guess, number)
  if (guess - number) > 5
    "Way too high!"
  elsif (guess - number) < -5
    "Way too low!"
  elsif guess > number
    "Too high!"
  elsif guess < number
    "Too low!"
  else
    "You got it!"
  end
end
