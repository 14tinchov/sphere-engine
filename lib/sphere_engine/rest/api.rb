require 'sphere_engine/rest/access'
require 'sphere_engine/rest/compilers'

module SphereEngine
  module REST
    # @note All methods have been separated into modules and follow the same grouping used in {http://sphere-engine.com/services the SphereEngine API Documentation}.
    module API
      include SphereEngine::REST::Access
      include SphereEngine::REST::Compilers
    end
  end
end
