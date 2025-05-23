# typed: strict
# frozen_string_literal: true

module Actions
  class Base < Sinatra::Base
    helpers Phlex::Sinatra

    after do
      clear_flash if request.get? && !request.xhr?
    end

    #: -> void
    def redirect_home
      redirect "/"
    end

    #: -> Models::Flash
    def flash
      session[:flash] ||= Models::Flash.new
    end

    #: -> void
    def clear_flash
      session[:flash] = Models::Flash.new
    end
  end
end
