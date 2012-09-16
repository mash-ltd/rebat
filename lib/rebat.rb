require 'thrift'

# thrift sources. load order is important.
$LOAD_PATH << File.join(File.dirname(__FILE__), 'rebat', 'thrift')

require 'rebat/thrift/rebat_d_b'
require 'rebat/thrift/rebat_constants'
require 'rebat/thrift/rebat_types'

require 'rebat/version'

module Rebat
  autoload  :Selector,      'rebat/selector'
  autoload  :Client,        'rebat/client'

  class << self
    attr_accessor :relations

    def new(*args)
      Rebat::Client.new(*args)
    end
  end
end
