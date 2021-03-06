require 'rackspace-fog/core/collection'
require 'rackspace-fog/clodo/models/compute/image'

module Fog
  module Compute
    class Clodo

      class Images < Fog::Collection

        model Fog::Compute::Clodo::Image

        def all
          data = connection.list_images_detail.body['images']
          load(data)
        end

        def get(image_id)
          image = connection.get_image_details(image_id).body['image']
          new(image) if image
        rescue Fog::Compute::Clodo::NotFound
          nil
        end

      end

    end
  end
end
