require 'rackspace-fog/core/credentials'

module Fog
  class << self

    def available_providers
      @available_providers ||= Fog.providers.values.select {|provider| Kernel.const_get(provider).available?}.sort
    end

  end

  class Bin
    class << self

      def available?
        availability = true
        for service in services
          begin
            service = self.class_for(service)
            availability &&= service.requirements.all? { |requirement| Fog.credentials.include?(requirement) }
          rescue ArgumentError => e
            Fog::Logger.warning(e.message)
            availability = false
          rescue => e
            availability = false
          end
        end

        if availability
          for service in services
            for collection in self.class_for(service).collections
              unless self.respond_to?(collection)
                self.class_eval <<-EOS, __FILE__, __LINE__
                  def self.#{collection}
                    self[:#{service}].#{collection}
                  end
                EOS
              end
            end
          end
        end

        availability
      end

      def collections
        services.map {|service| self[service].collections}.flatten.sort_by {|service| service.to_s}
      end

    end
  end

end

require 'rackspace-fog/bin/aws'
require 'rackspace-fog/bin/bluebox'
require 'rackspace-fog/bin/brightbox'
require 'rackspace-fog/bin/cloudstack'
require 'rackspace-fog/bin/clodo'
require 'rackspace-fog/bin/dnsimple'
require 'rackspace-fog/bin/dnsmadeeasy'
require 'rackspace-fog/bin/dynect'
require 'rackspace-fog/bin/ecloud'
require 'rackspace-fog/bin/glesys'
require 'rackspace-fog/bin/go_grid'
require 'rackspace-fog/bin/google'
require 'rackspace-fog/bin/hp'
require 'rackspace-fog/bin/ibm'
require 'rackspace-fog/bin/joyent'
require 'rackspace-fog/bin/libvirt'
require 'rackspace-fog/bin/linode'
require 'rackspace-fog/bin/local'
require 'rackspace-fog/bin/bare_metal_cloud'
require 'rackspace-fog/bin/ninefold'
require 'rackspace-fog/bin/rackspace'
require 'rackspace-fog/bin/openstack'
require 'rackspace-fog/bin/ovirt'
require 'rackspace-fog/bin/stormondemand'
require 'rackspace-fog/bin/terremark'
require 'rackspace-fog/bin/vcloud'
require 'rackspace-fog/bin/virtual_box'
require 'rackspace-fog/bin/vmfusion'
require 'rackspace-fog/bin/vsphere'
require 'rackspace-fog/bin/voxel'
require 'rackspace-fog/bin/xenserver'
require 'rackspace-fog/bin/zerigo'
