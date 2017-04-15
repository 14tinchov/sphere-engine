module SphereEngine
  module REST
    module Submissions
      # @param options [Hash]
      # This request you should send a compilerId and source
      def create_submission_compiler(options = {})
        perform_post_requests_of_compílers_service('/submissions', options)
      end

      # @param options [Hash]
      # This request you should send a submissionId
      def fetch_submission_compilers(submission_id, options = {})
        perform_get_requests_of_compílers_service("/submissions/#{submission_id}")
      end
    end
  end
end