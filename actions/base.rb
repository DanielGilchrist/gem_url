# typed: strict
# frozen_string_literal: true

module Actions
  class Base < Sinatra::Base
    helpers Phlex::Sinatra
    set :public_folder, File.join(File.dirname(__FILE__), "public")
  end
end
