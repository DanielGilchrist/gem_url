# typed: strict
# frozen_string_literal: true

class String
  #: -> bool
  def blank? = gsub(" ", "").empty?
end
