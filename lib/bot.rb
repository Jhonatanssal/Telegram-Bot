# rubocop:disable Layout/LineLength
# rubocop:disable Metrics/MethodLength

require 'telegram/bot'
require_relative 'countries.rb'
require_relative 'methods.rb'
require_relative 'phrases.rb'

class Bot
  def initialize
    @methods = Methods.new
    @token = @methods.token
    bot
  end

  def bot
    Telegram::Bot::Client.run(@token) do |bot|
      bot.listen do |message|
        case message.text
        when /start/i
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name} , Welcome to Telegram Time bot created by Jhonatan Sarrazola, this bot is created to let you know the actual time in some countries compared with the UTC 00 time.\nUse `start` to start the bot,\n`phrase` to receive a phrase,\n`time + Country_Name` to search for a country and\n`stop`, `exit` or `end` to end it.\nMost of the countries available, you have to type 'english name of the country', (e.g,time france). To see countries that has a space in their name you need to replace that space with a '_' and each name has to be capitalized. In countries where are different time zones, it will display the main time zone.")
        when /phrase/i
          @quote = Phrases.new
          @phrase = @quote.select_phrase
          bot.api.send_message(chat_id: message.chat.id, text: "Hello #{message.from.first_name} here is your phrase:\n\n#{@phrase}.\n\nHave a very good day!")
        when /time/i
          @txt = message.text
          @method = Methods.new
          @input = @method.valid(@txt)
          if @input
            time(@input)
            bot.api.send_message(chat_id: message.chat.id, text: "The time in #{@input} is #{@y}#{@n} and the UTC 0000 time is #{@tt} with a difference of #{@m} hours.")
          else
            bot.api.send_message(chat_id: message.chat.id, text: 'No valid country, try again', date: message.date)
          end
        when /stop/i, /exit/i, /end/i
          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}", date: message.date)
        else bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry, #{message.from.first_name}, you need to use  /start,  /stop , or /time and a valid Capitalized country name.", date: message.date)
        end
      end
    end
  end
end

def time(input)
  @country = TimeOutput.new
  @ans = @country.countries
  @ans.filter! { |i, _j| i == input }
  @t = Time.now.utc
  @tt = @t.strftime('%k:%M')
  @h = @t.strftime('%k').to_i
  @n = @t.strftime(':%M')
  @m = @ans[@input].to_s
  @y =  if (@h.to_i + @ans[@input].to_i) >= 24
          @y = @h.to_i + @ans[@input].to_i - 24
        elsif (@h.to_i + @ans[@input].to_i) < 0
          @y = @h.to_i + @ans[@input].to_i + 24
        else
          @y = @h.to_i + @ans[@input].to_i
        end
        [@y, @n, @tt, @m]
end

# rubocop:enable Layout/LineLength
# rubocop:enable Metrics/MethodLength
