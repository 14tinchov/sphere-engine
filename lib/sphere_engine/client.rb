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
  end
end