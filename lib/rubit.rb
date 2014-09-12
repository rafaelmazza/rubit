require "rubit/version"

module Rubit
end

class NilClass
  def method_missing(*)
    nil
  end
end

require 'rubit/cli'
require 'rubit/command_parser'
require 'rubit/bitmap'
