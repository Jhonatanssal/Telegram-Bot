require_relative '../lib/bot.rb'
require_relative '../lib/countries.rb'
require_relative '../lib/phrases.rb'
require_relative '../lib/methods.rb'

puts 'Welcome to Telegram Bot'
puts "Please go to this link 'https://web.telegram.org/#/im?p=@CountryTimebot' in your browser."
puts 'The Bot is currently working, go to telegram..'
puts 'To stop the Bot use Ctrl + z'

Bot.new
