require 'rackspace-fog/core/collection'
require 'rackspace-fog/xenserver/models/compute/vbd'

module Fog
  module Compute
    class XenServer

      class Vbds < Fog::Collection

        model Fog::Compute::XenServer::VBD
        
        def initialize(attributes)
          super
        end

        def all(options = {})
          data = connection.get_records 'VBD'
          load(data)
        end

        def get( vbd_ref )
          if vbd_ref && vbd = connection.get_record( vbd_ref, 'VBD' )
            new(vbd)
          end
        rescue Fog::XenServer::NotFound
          nil
        end

      end

    end
  end
end
