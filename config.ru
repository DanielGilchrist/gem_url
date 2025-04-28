# typed: strict

require_relative "app"

RubyVM::YJIT.enable
run App
