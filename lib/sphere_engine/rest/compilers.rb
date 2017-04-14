module SphereEngine
  module REST
    module Compilers
      include SphereEngine::REST::Utils

      def all_compilers
        perform_get_requests_of_problems_service('/compilers')
      end
    end
  end
end