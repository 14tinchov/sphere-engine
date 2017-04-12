require 'addressable/uri'
require 'http'

module SphereEngine
  module REST
    class Request
      BASE_URL_COMPILERS_SERVICE = 'https://09de42b6.compilers.sphere-engine.com/api/V3/'.freeze
      BASE_URL_PROBLEMS_SERVICE  = 'https://09de42b6.problems.sphere-engine.com/api/v3'.freeze
      attr_accessor :client, :headers, :options, :service, :path, :request_method, :uri

      # @param client [SphereEngine::Client]
      # @param request_method [String, Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [SphereEngine::REST::Request]
      def initialize(client, request_method, service, path, options = {})
        @client = client
        @service = service
        @uri = Addressable::URI.parse(path.start_with?('http') ? path : build_base_url + path)
        @path = uri.path
        @options = options
      end

      # @return [Array, Hash]
      def perform
        response = HTTP.get(uri, :params => {:access_token => "37fcd1a005858e2d20112a21116a56f9"})
        response_body = response.body.empty? ? '' : symbolize_keys!(response.parse)
        fail_or_return_response_body(response.code, response_body)
      end

      def fail_or_return_response_body(code, body)
        # error = error(code, body, headers)
        # raise(error) if error
        body
      end

      def symbolize_keys!(object)
        if object.is_a?(Array)
          object.each_with_index do |val, index|
            object[index] = symbolize_keys!(val)
          end
        elsif object.is_a?(Hash)
          object.keys.each do |key|
            object[key.to_sym] = symbolize_keys!(object.delete(key))
          end
        end
        object
      end

      def build_base_url
        if service == :compilers
          return BASE_URL_COMPILERS_SERVICE
        else
          return BASE_URL_PROBLEMS_SERVICE
        end
      end
    end
  end
end