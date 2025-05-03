# typed: strict
# frozen_string_literal: true

class Object
  #: -> bool
  def blank?
    return false unless respond_to?(:empty?)

    !!self #: as untyped
      .empty?
  end
end
