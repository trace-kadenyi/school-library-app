require_relative 'nameable'

# base decorator
class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

# capitalize decorator
class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

# trim decorator
class TrimmerDecorator < BaseDecorator
  def correct_name
    super.length > 10 ? super[0..9] : super
  end
end
