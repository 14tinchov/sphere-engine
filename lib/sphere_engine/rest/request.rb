require 'addressable/uri'
require 'http'
require 'json'

module SphereEngine
  module REST
    class Request
      BASE_URL_COMPILERS_SERVICE = 'https://09de42b6.compilers.sphere-engine.com/api/V3'.freeze
      BASE_URL_PROBLEMS_SERVICE  = 'https://09de42b6.problems.sphere-engine.com/api/v3'.freeze
      attr_accessor :client, :headers, :options, :service, :path, :request_method, :uri

      # @param client [SphereEngine::Client]
      # @param request_method [String, Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [SphereEngine::REST::Request]
      def initialize(client, request_method, service, path, options = {})
        @client = client
        @token  = client.get_token(service)
        @service = service
        @request_method = request_method
        @uri = Addressable::URI.parse(path.start_with?('http') ? path : build_base_url + path)
        @path = uri.path
        @options = options
      end

      # @return [Array, Hash]
      def perform
        response = build_http_request
        response_body = response.body.empty? ? '' : format_to_response(response)
        fail_or_return_response_body(response.code, response_body)
      end

      def format_to_response(response)
        begin
          JSON.parse(response.to_s)
        rescue JSON::ParserError
          response.to_s
        end
      end

      def fail_or_return_response_body(code, body)
        error = error(code, body)
        raise(error) if error
        body
      end

      def error(code, body)
        klass = SphereEngine::Error::ERRORS[code]
        if klass
          klass.from_response(body)
        end
      end

      def build_base_url
        return case @service
        when :compilers
          BASE_URL_COMPILERS_SERVICE
        when :problems
          BASE_URL_PROBLEMS_SERVICE
        end
      end

      def build_http_request
        return case @request_method
        when :get
          HTTP.get(uri, params: build_request_params)
        when :post
          HTTP.post(uri, params: build_request_params)
        when :put
          HTTP.put(uri, params: build_request_params)
        end
      end

      def build_request_params
        {
          access_token: @token
        }.merge(options)
      end
    end
  end
end