require 'json'

module Fog
  module JSON

    def self.sanitize(data)
      case data
      when Array
        data.map {|datum| sanitize(datum)}
      when Hash
        for key, value in data
          data[key] = sanitize(value)
        end
      when ::Time
        data.strftime("%Y-%m-%dT%H:%M:%SZ")
      else
        data
      end
    end

    def self.encode(obj)
      ::JSON.generate(obj)
    end

    def self.decode(obj)
      ::JSON.parse(obj)
    end

  end
end
