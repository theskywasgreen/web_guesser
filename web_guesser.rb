require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess, number)
  bg_color = css_color(message)
  erb :index, :locals => {:number => number, :message => message, :guess => params['guess'].to_i, :bg_color => bg_color }
end

def check_guess(guess, number)
  if guess.nil?
    "Enter guess"
  else
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
end

def css_color(message)
  case message
    when "Enter guess" then "#FFF"
    when "Way too high!" then "#ff0000"
    when "Way too low!" then "#ff0000"
    when "Too high!" then "#FF9473"
    when "Too low!" then "#FF9473"
    when "You got it!" then "#62D99C"
  end
end
