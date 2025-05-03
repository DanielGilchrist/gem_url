# typed: strict
# frozen_string_literal: true

require "sinatra"
require "sqlite3"
require "phlex"
require "phlex-sinatra"
require "securerandom"

require_relative "actions/base"
require_relative "actions/home"
require_relative "actions/shorten"
require_relative "actions/short_code"
require_relative "core_ext/false_class"
require_relative "core_ext/object"
require_relative "core_ext/nil_class"
require_relative "core_ext/true_class"
require_relative "core_ext/string"
require_relative "db/setup"
require_relative "models/url"
require_relative "views/components/home"
require_relative "views/components/layout"
require_relative "views/components/result"
