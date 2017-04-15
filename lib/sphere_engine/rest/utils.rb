require 'sphere_engine/rest/request'

module SphereEngine
  module REST
    module Utils
    private
      def perform_get_requests_of_problems_service(path, options = {})
        perform_request(:get, :problems, path, options)
      end

      def perform_get_requests_of_compílers_service(path, options = {})
        perform_request(:get, :compilers, path, options)
      end

      def perform_post_requests_of_problems_service(path, options = {})
        perform_request(:post, :problems, path, options)
      end

      def perform_post_requests_of_compílers_service(path, options = {})
        perform_request(:post, :compilers, path, options)
      end

      def perform_request(request_method, service, path, options = {})
        SphereEngine::REST::Request.new(self, request_method, service, path, options).perform
      end
    end
  end
end
