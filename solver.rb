class Solver
  attr_accessor :factorial, :reverse, :fizzbuzz

  # create method called factorial
  def factorial(n)
    # if n is 1 or 0, return 1
    if n == 1 || n == 0
      return 1
      # else if n is greater than 1
    elsif n > 1
      # return n times factorial of n minus 1
      return n * factorial(n-1)
      # else if n is negative return an exception
    else
      raise "n must be greater than or equal to 0"
    end
  end
  # create method called reverse that reverses a string
  def reverse(string)
    # if the string is empty return the string
    if string == ""
      return string
      # else return the last letter of the string plus the reverse of the string minus the last letter
    else
      return string[-1] + reverse(string[0..-2])
    end
  end

  #  create a method called fizzbuzz
  def fizzbuzz(n)
    if n % 3 == 0 && n % 5 == 0
      return "fizzbuzz"
    elsif n % 3 == 0
      return "fizz"
    elsif n % 5 == 0
      return "buzz"
    else
      return n
    end
  end
end
