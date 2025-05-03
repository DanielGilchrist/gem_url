# typed: strict
# frozen_string_literal: true

module Models
  class Flash
    #: -> void
    def initialize
      @message = nil #: String?
      @kind = nil #: Symbol?
    end

    #: -> bool
    def empty?
      @message.blank?
    end

    #: -> String?
    def success
      return if @kind != :success

      @message
    end

    #: (String message) -> void
    def success=(message)
      @message = message
      @kind = :success
    end

    #: -> String?
    def failure
      return if @kind != :failure

      @message
    end

    #: (String message) -> void
    def failure=(message)
      @message = message
      @kind = :failure
    end
  end
end
