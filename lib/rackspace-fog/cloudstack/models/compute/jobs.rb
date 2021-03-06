require 'rackspace-fog/core/collection'
require 'rackspace-fog/cloudstack/models/compute/job'

module Fog
  module Compute
    class Cloudstack

      class Jobs < Fog::Collection

        model Fog::Compute::Cloudstack::Job

        def all
          data = connection.list_async_jobs["listasyncjobsresponse"]["asyncjobs"] || []
          load(data)
        end

        def get(job_id)
          if job = connection.query_async_job_result('jobid' => job_id)["listasyncjobsresponse"]["asyncjobs"].first
            new(job)
          end
        rescue Fog::Compute::Cloudstack::BadRequest
          nil
        end
      end

    end
  end
end
