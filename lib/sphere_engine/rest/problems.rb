module SphereEngine
  module REST
    module Problems
      include SphereEngine::REST::Utils

      # @param options [Hash]
      # This request you could send a limit and offset
      def all_problems(options = {})
        perform_get_requests_of_problems_service('/problems', options)
      end

      # @param options [Hash]
      # This request you could send a limit and offset
      def create_problem(options = {})
        perform_post_requests_of_problems_service('/problems', options)
      end

      # @param code [String]
      def get_problem(code)
        perform_get_requests_of_problems_service("/problems/#{code}")
      end

      # @param code [String]
      # @param options [Hash]
      def update_problem(code, options = {})
        perform_put_requests_of_problems_service("/problems/#{code}", options)
      end
    end
  end
end
