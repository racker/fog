require 'rackspace-fog/core/collection'
require 'rackspace-fog/brightbox/models/compute/zone'

module Fog
  module Compute
    class Brightbox

      class Zones < Fog::Collection

        model Fog::Compute::Brightbox::Zone

        def all
          data = connection.list_zones
          load(data)
        end

        def get(identifier)
          return nil if identifier.nil? || identifier == ""
          data = connection.get_zone(identifier)
          new(data)
        rescue Excon::Errors::NotFound
          nil
        end

      end

    end
  end
end