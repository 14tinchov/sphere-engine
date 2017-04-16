module SphereEngine
  # Custom error class for rescuing from all SphereEngine errors
  class Error < StandardError
    # @return [Integer]
    attr_reader :code

    # Initializes a new Error object
    #
    # @param message [Exception, String]
    # @param code [Integer]
    # @return [SphereEngine::Error]
    def initialize(message = '', code = nil)
      super(message)
      @code = code
    end

    # ClientErrors(Raised when SphereEngine returns a 4xx HTTP status code)
    #
    # Raised when SphereEngine returns the HTTP status code 400
    BadRequest = Class.new(self)

    # Raised when SphereEngine returns the HTTP status code 401
    Unauthorized  = Class.new(self)

    ERRORS = {
      400 => SphereEngine::Error::BadRequest,
      401 => SphereEngine::Error::Unauthorized
    }

    class << self
      # Create a new error from an HTTP response
      #
      # @param body [String]
      # @param headers [Hash]
      # @return [SphereEngine::Error]
      def from_response(body)
        message, code = parse_error(body)
        new(message, code)
      end

    private

      def parse_error(body)
        if body.nil? || body.empty?
          ['', nil]
        elsif  body["message"] || body[:message]
          [ body["message"] || body[:message], nil]
        end
      end
    end
  end
end