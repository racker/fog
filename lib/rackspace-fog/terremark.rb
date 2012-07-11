require 'rackspace-fog/core'

require 'rackspace-fog/terremark/shared'
require 'rackspace-fog/terremark/parser'
require 'rackspace-fog/terremark/vcloud'

module Fog
  module Terremark
    VCLOUD_OPTIONS = [:terremark_vcloud_username, :terremark_vcloud_password]
  end
end
