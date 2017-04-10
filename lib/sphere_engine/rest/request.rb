require 'addressable/uri'
require 'http'
require 'http/form_data'
require 'json'
require 'openssl'

module SphereEngine
  module REST
    class Request
      BASE_URL = 'https://09de42b6.problems.sphere-engine.com/api/v3'.freeze
      attr_accessor :client, :headers, :options, :path, :request_method, :uri

      # @param client [SphereEngine::Client]
      # @param request_method [String, Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [SphereEngine::REST::Request]
      def initialize(client, request_method, path, options = {})
        @client = client
        @uri = Addressable::URI.parse(path.start_with?('http') ? path : BASE_URL + path)
        set_multipart_options!(request_method, options)
        @path = uri.path
        @options = options
      end

      # @return [Array, Hash]
      def perform
        
        # options_key = @request_method == :get ? :params : :form
        # response = http_client.headers(@headers).public_send(@request_method, @uri.to_s, options_key => @options)
        # response_body = response.body.empty? ? '' : symbolize_keys!(response.parse)
        # response_headers = response.headers
        # fail_or_return_response_body(response.code, response_body, response_headers)
      end
    end
  end
end