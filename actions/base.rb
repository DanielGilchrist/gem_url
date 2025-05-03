# typed: strict
# frozen_string_literal: true

module Actions
  class Base < Sinatra::Base
    helpers Phlex::Sinatra
    set :public_folder, File.join(File.dirname(__FILE__), "public")

    #: -> void
    def redirect_home
      redirect "/"
    end

    #: (String url) -> bool
    def valid_url?(url)
      uri = URI.parse(url)
      uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
    rescue URI::InvalidURIError
      false
    end
  end
end
