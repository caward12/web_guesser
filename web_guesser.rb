require 'sinatra'
require 'sinatra/reloader'

SECRET_NUM = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  color = color(guess)
  erb :index, :locals => {:message => message, :number => SECRET_NUM, :color => color}
end

def check_guess(guess)
  if guess > (SECRET_NUM + 5)
    message = "Way too high!"
  elsif guess < (SECRET_NUM - 5)
    message = "Way too low!"
  elsif guess > SECRET_NUM
    message = "Too high!"
  elsif guess < SECRET_NUM
    message = "Too low!"
  else
    message = "You got it right! The number is #{SECRET_NUM}"
  end
end

def color(guess)
  if guess > (SECRET_NUM + 5) || guess < (SECRET_NUM - 5)
  color = "red"
  elsif guess < SECRET_NUM || guess > SECRET_NUM
  color = "#ffcccc"
  else
  color = "green"
end
end