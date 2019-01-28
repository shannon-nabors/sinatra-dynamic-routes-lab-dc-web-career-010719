require_relative 'config/environment'
require 'pry'

class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do
    @name = params[:name]
    @name.reverse
  end

  get '/square/:number' do
    @num = params[:number].to_i
    (@num**2).to_s
  end

  get '/say/:number/:phrase' do
    display = ""
    @num, @phrase = params[:number].to_i, params[:phrase]
    @num.times do
      display += "#{@phrase}\n"
    end
    display
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
  end

  get '/:operation/:number1/:number2' do
    @op, @n1, @n2 = params[:operation].downcase, params[:number1].to_i, params[:number2].to_i
    ops = {
      'add' => (@n1 + @n2),
      'subtract' => (@n1 - @n2),
      'multiply' => (@n1 * @n2),
      'divide' => (@n1/@n2)
    }
    "#{ops[@op]}"
  end

end
