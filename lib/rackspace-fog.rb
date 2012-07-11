require File.join(File.dirname(__FILE__), 'rackspace-fog', 'core')

module Fog

  unless const_defined?(:VERSION)
    VERSION = '1.4.1'
  end

end

# FIXME: these should go away (force usage of Fog::[Compute, CDN, DNS, Storage]  etc)
require 'rackspace-fog/providers'
require 'rackspace-fog/terremark'

require 'rackspace-fog/compute'
require 'rackspace-fog/identity'
require 'rackspace-fog/image'
require 'rackspace-fog/volume'
require 'rackspace-fog/cdn'
require 'rackspace-fog/dns'
require 'rackspace-fog/storage'
