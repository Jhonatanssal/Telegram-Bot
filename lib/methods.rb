require_relative './countries.rb'

def valid(input)
  others = Time_output.new
  count = others.countries
  var = input.length
  str = input[5...var]
  if str[0].match(/[A-Z]/)
    str
  else
    str.capitalize!
  end
  return str.to_sym if others.countries.include?(str.to_sym)
  false
end
