require_relative './countries.rb'

class Methods
  attr_reader :token 
  def valid(input)
    others = TimeOutput.new
    country = others.countries
    var = input.length
    str = input[5..var]
    if str[0].match(/[A-Z]/)
      str
    else
      str.capitalize!
    end
    if country.include?(str.to_sym)
      return str.to_sym
    end
    false
  end

  def token
    @token = '1068608846:AAHf0-nsgkywlVJO18wj-vzEf0zg14Ovbp4'
  end
end
