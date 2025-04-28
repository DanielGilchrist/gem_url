# typed: strict

module Actions
  class Base < Sinatra::Base
    sig { params(component: Phlex::HTML).void }
    def phlex(component); end
  end
end
