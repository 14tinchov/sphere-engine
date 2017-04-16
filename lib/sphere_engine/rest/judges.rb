module SphereEngine
  module REST
    module Judges
      include SphereEngine::REST::Utils

      # @options [Hash]
      def all_judges(options = {})
        perform_get_requests_of_problems_service("/judges", options)
      end

      # @options [Hash]
      def create_judge(options = {})
        perform_post_requests_of_problems_service("/judges", options)
      end

      # @judge_id [String]
      def get_judge(judge_id)
        perform_get_requests_of_problems_service("/judges/#{judge_id}")
      end

      # @judge_id [String]
      # @options [Hash]
      def update_judge(judge_id, options = {})
        perform_put_requests_of_problems_service("/judges/#{judge_id}", options)
      end
    end
  end
end