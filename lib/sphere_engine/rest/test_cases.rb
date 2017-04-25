module SphereEngine
  module REST
    module TestCases
      include SphereEngine::REST::Utils

      # @param problem_id [String]
      def list_testcases(problem_id)
        perform_get_requests_of_problems_service("/problems/#{problem_id}/testcases")
      end

      # @param problem_id [String]
      # @options [Hash]
      def create_problem_testcase(problem_id, options = {})
        perform_post_requests_of_problems_service("/problems/#{problem_id}/testcases", options)
      end

      # @param problem_id  [String]
      # @param testcase_id [String]
      # @param options [Hash]
      def update_problem_testcase(problem_id, testcase_id, options = {})
        perform_put_requests_of_problems_service("/problems/#{problem_id}/testcases/#{testcase_id}", options)
      end

      # @param problem_id  [String]
      # @param testcase_id [String]
      def get_testcase(problem_id, testcase_id)
        perform_get_requests_of_problems_service("/problems/#{problem_id}/testcases/#{testcase_id}")
      end

      # @param problem_id  [String]
      # @param testcase_id [String]
      # @param filename    [String]
      def get_testcase_file(problem_id, testcase_id, filename)
        perform_get_requests_of_problems_service(
          "/problems/#{problem_id}/testcases/#{testcase_id}/#{filename}"
        )
      end
    end
  end
end
