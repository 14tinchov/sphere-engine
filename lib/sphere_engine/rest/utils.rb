require 'sphere_engine/rest/request'

module SphereEngine
  module REST
    module Utils
    private
      def perform_get(path, options = {})
        perform_request(:get, path, options)
      end

      def perform_request(request_method, path, options = {})
        SphereEngine::REST::Request.new(self, request_method, path, options).perform
      end
    end
  end
end
