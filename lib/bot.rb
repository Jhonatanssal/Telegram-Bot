require 'telegram/bot'
require_relative 'countries.rb'
require_relative 'methods.rb'

class Bot
  def initialize
    @token = '1169735408:AAFB1CCrgujdVmwUANIQgS8MTKGvUy4ZrYk'
    bot
  end

  def bot
    Telegram::Bot::Client.run(@token) do |bot|
      bot.listen do |message|
        case message.text
        when /start/i
                                                                                                    
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name} , Welcome to Telegram Time bot created by Jhonatan Sarrazola, this bot is created to let you know the actual time in some countries compared with the UTC 00 time. Use 'start' to start the bot, 'time' to search for a country and 'stop' to end it. All of the countries available, but you have to type 'english name of the country', (e.g, France).")

        when /stop/i, /exit/i

          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}", date: message.date)
        when /time/i
          @txt = message.text
          @input = valid(@txt)
          @country = Time_output.new
          @ans = @country.countries
          @ans.filter! { |i, j| i == @input }         
          if @input
            @t = Time.now.utc
            @tt = @t.strftime("%k:%M")
            @h = @t.strftime("%k").to_i
            @n = @t.strftime(":%M")
            @m = @ans[@input].to_s
            if (0..4).include?(@h)
              @y = @h.to_i + @ans[@input].to_i + 24
            else
              @y = @h.to_i + @ans[@input].to_i
            end
            bot.api.send_message(chat_id: message.chat.id, text: "The time in #{@input} is #{@y}#{@n} and the UTC 0000 time is #{@tt} with a difference of #{@m} hours.")
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'No valid country, try again', date: message.date)
          end
        else bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry, #{message.from.first_name}, you need to use  /start,  /stop , or /time and a valid Capitalized country name.", date: message.date)
        end
      end
    end
  end
end
