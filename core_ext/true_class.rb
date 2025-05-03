# typed: strict
# frozen_string_literal: true

class TrueClass
  #: -> FalseClass
  def blank? = false
end
