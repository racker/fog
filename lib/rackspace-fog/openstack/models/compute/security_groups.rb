require 'rackspace-fog/core/collection'
require 'rackspace-fog/openstack/models/compute/security_group'

module Fog
  module Compute
    class OpenStack

      class SecurityGroups < Fog::Collection

        model Fog::Compute::OpenStack::SecurityGroup

        def all
          load(connection.list_security_groups.body['security_groups'])
        end

        def get(security_group_id)
          if security_group_id
            new(connection.get_security_group(security_group_id).body['security_group'])
          end
        rescue Fog::Compute::OpenStack::NotFound
          nil
        end

      end
    end
  end
end
