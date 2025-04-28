# typed: strict

require_relative "require"

require_relative "actions/home"
require_relative "actions/shorten"

class App < Sinatra::Base
  set :public_folder, File.join(File.dirname(__FILE__), "public")

  use Actions::Home
  use Actions::Shorten
end

App.run! if __FILE__ == $0
