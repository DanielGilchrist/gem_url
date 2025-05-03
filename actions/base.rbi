# typed: strict

module Actions
  class Base < Sinatra::Base
    sig { params(object: Phlex::HTML).void }
    def phlex(object); end
  end
end
