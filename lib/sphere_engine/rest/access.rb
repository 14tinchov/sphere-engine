require 'sphere_engine/rest/utils'

module SphereEngine
  module REST
    module Access
      include SphereEngine::REST::Utils

      def all_compilers(options = {} )
        perform_get('/compilers', options)
      end
    end
  end
end
