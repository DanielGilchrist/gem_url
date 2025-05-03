# typed: strict
# frozen_string_literal: true

require_relative "require"

class App < Sinatra::Base
  enable :sessions

  use Actions::NotFound
  use Actions::Home
  use Actions::Shorten
  use Actions::ShortCode
end

App.run! if __FILE__ == $PROGRAM_NAME
