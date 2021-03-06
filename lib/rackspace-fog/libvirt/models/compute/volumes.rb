require 'rackspace-fog/core/collection'
require 'rackspace-fog/libvirt/models/compute/volume'

module Fog
  module Compute
    class Libvirt

      class Volumes < Fog::Collection

        model Fog::Compute::Libvirt::Volume

        def all(filter = {})
          load(connection.list_volumes(filter))
        end

        def get(key)
          self.all(:key => key).first
        end

      end

    end
  end
end
