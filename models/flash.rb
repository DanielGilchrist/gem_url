# typed: strict
# frozen_string_literal: true

module Models
  class Flash
    #: Type?
    attr_reader :type

    #: -> void
    def initialize
      @type = nil #: Type?
    end

    #: (String message) -> void
    def success=(message)
      @type = Success.new(message)
    end

    #: (String message) -> void
    def failure=(message)
      @type = Failure.new(message)
    end
  end
end
