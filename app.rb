# typed: strict
# frozen_string_literal: true

require_relative "require"

class App < Sinatra::Base
  set :public_folder, File.join(File.dirname(__FILE__), "public")

  use Actions::Home
  use Actions::Shorten
  use Actions::ShortCode
end

App.run! if __FILE__ == $PROGRAM_NAME
