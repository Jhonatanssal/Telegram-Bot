require_relative './countries.rb'

class Methods
  def valid(input)
    others = TimeOutput.new
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

  def token
    @token = '1169735408:AAFB1CCrgujdVmwUANIQgS8MTKGvUy4ZrYk'
  end
end
