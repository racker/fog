module Fog
  module DNS

    def self.[](provider)
      self.new(:provider => provider)
    end

    def self.new(attributes)
      attributes = attributes.dup # prevent delete from having side effects
      case provider = attributes.delete(:provider).to_s.downcase.to_sym
      when :aws
        require 'rackspace-fog/aws/dns'
        Fog::DNS::AWS.new(attributes)
      when :bluebox
        require 'rackspace-fog/bluebox/dns'
        Fog::DNS::Bluebox.new(attributes)
      when :dnsimple
        require 'rackspace-fog/dnsimple/dns'
        Fog::DNS::DNSimple.new(attributes)
      when :dnsmadeeasy
        require 'rackspace-fog/dnsmadeeasy/dns'
        Fog::DNS::DNSMadeEasy.new(attributes)
      when :dynect
        require 'rackspace-fog/dynect/dns'
        Fog::DNS::Dynect.new(attributes)
      when :linode
        require 'rackspace-fog/linode/dns'
        Fog::DNS::Linode.new(attributes)
      when :zerigo
        require 'rackspace-fog/zerigo/dns'
        Fog::DNS::Zerigo.new(attributes)
      when :rackspace
        require 'rackspace-fog/rackspace/dns'
        Fog::DNS::Rackspace.new(attributes)
      else
        raise ArgumentError.new("#{provider} is not a recognized dns provider")
      end
    end

    def self.providers
      Fog.services[:dns]
    end

    def self.zones
      zones = []
      for provider in self.providers
        begin
          zones.concat(self[provider].zones)
        rescue # ignore any missing credentials/etc
        end
      end
      zones
    end

  end
end
