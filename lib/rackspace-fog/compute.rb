module Fog
  module Compute

    def self.[](provider)
      self.new(:provider => provider)
    end

    def self.new(attributes)
      attributes = attributes.dup # prevent delete from having side effects
      case provider = attributes.delete(:provider).to_s.downcase.to_sym
      when :aws
        require 'rackspace-fog/aws/compute'
        Fog::Compute::AWS.new(attributes)
      when :bluebox
        require 'rackspace-fog/bluebox/compute'
        Fog::Compute::Bluebox.new(attributes)
      when :brightbox
        require 'rackspace-fog/brightbox/compute'
        Fog::Compute::Brightbox.new(attributes)
      when :cloudstack
        require 'rackspace-fog/cloudstack/compute'
        Fog::Compute::Cloudstack.new(attributes)
      when :clodo
        require 'rackspace-fog/clodo/compute'
        Fog::Compute::Clodo.new(attributes)
      when :ecloud
        require 'rackspace-fog/ecloud/compute'
        Fog::Compute::Ecloud.new(attributes)
      when :glesys
        require 'rackspace-fog/glesys/compute'
        Fog::Compute::Glesys.new(attributes)
      when :gogrid
        require 'rackspace-fog/go_grid/compute'
        Fog::Compute::GoGrid.new(attributes)
      when :hp
        require 'rackspace-fog/hp/compute'
        Fog::Compute::HP.new(attributes)
      when :ibm
        require 'rackspace-fog/ibm/compute'
        Fog::Compute::IBM.new(attributes)
      when :joyent
        require 'rackspace-fog/joyent/compute'
        Fog::Compute::Joyent.new(attributes)
      when :libvirt
        require 'rackspace-fog/libvirt/compute'
        Fog::Compute::Libvirt.new(attributes)
      when :linode
        require 'rackspace-fog/linode/compute'
        Fog::Compute::Linode.new(attributes)
      when :new_servers
        require 'rackspace-fog/bare_metal_cloud/compute'
        warn "[DEPRECATION] `new_servers` is deprecated. Please use `bare_metal_cloud` instead."
        Fog::Compute::BareMetalCloud.new(attributes)
      when :baremetalcloud
        require 'rackspace-fog/bare_metal_cloud/compute'
        Fog::Compute::BareMetalCloud.new(attributes)
      when :ninefold
        require 'rackspace-fog/ninefold/compute'
        Fog::Compute::Ninefold.new(attributes)
      when :openstack
        require 'rackspace-fog/openstack/compute'
        Fog::Compute::OpenStack.new(attributes)
      when :ovirt
        require 'rackspace-fog/ovirt/compute'
        Fog::Compute::Ovirt.new(attributes)
      when :rackspace
        require 'rackspace-fog/rackspace/compute'
        Fog::Compute::Rackspace.new(attributes)
      when :stormondemand
        require 'rackspace-fog/storm_on_demand/compute'
        Fog::Compute::StormOnDemand.new(attributes)
      when :vcloud
        require 'rackspace-fog/vcloud/compute'
        Fog::Vcloud::Compute.new(attributes)
      when :virtualbox
        require 'rackspace-fog/virtual_box/compute'
        Fog::Compute::VirtualBox.new(attributes)
      when :vmfusion
        require 'rackspace-fog/vmfusion/compute'
        Fog::Compute::Vmfusion.new(attributes)
      when :voxel
        require 'rackspace-fog/voxel/compute'
        Fog::Compute::Voxel.new(attributes)
      when :vsphere
        require 'rackspace-fog/vsphere/compute'
        Fog::Compute::Vsphere.new(attributes)
      when :xenserver
        require 'rackspace-fog/xenserver/compute'
        Fog::Compute::XenServer.new(attributes)
      else
        raise ArgumentError.new("#{provider} is not a recognized compute provider")
      end
    end

    def self.providers
      Fog.services[:compute]
    end

    def self.servers
      servers = []
      for provider in self.providers
        begin
          servers.concat(self[provider].servers)
        rescue # ignore any missing credentials/etc
        end
      end
      servers
    end

  end
end
