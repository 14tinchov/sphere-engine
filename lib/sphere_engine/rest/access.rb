require 'sphere_engine/rest/utils'

module SphereEngine
  module REST
    module Access
      include SphereEngine::REST::Utils

      def test_method
        perform_get_requests_of_problems_service('/test')
      end
    end
  end
end
