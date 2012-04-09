require File.dirname(__FILE__) + '/api_helper'
require 'agent/control'
require 'agent/resque_jobs'

# make Thrift Exceptions behave a bit more like standard Exceptions
module Thrift
  class Exception
    def to_s
      "%s: %s" % [self.class.name, message]
    end
  end
end
