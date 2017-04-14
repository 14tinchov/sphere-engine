require 'sphere_engine/error'

module SphereEngine
  class Client
    attr_accessor :access_token_compilers, :access_token_problems

    # Initializes a new Client object
    #
    # @param options [Hash]
    # @return [SphereEngine::Client]
    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
      yield(self) if block_given?
    end

    # @return [Hash]
    def credentials
      {
        access_token_compilers: access_token_compilers,
        access_token_problems: access_token_problems
      }
    end

    # @return [Boolean]
    def credentials?
      credentials.values.all?
    end

    # @return[String]
    def get_token(service)
      return case service
      when :compillers
        access_token_compilers
      when :problems
        access_token_problems
      end
    end
  end
end