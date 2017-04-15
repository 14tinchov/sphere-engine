require 'sphere_engine/rest/access'
require 'sphere_engine/rest/languages'
require 'sphere_engine/rest/compilers'
require 'sphere_engine/rest/submissions'

module SphereEngine
  module REST
    # @note All methods have been separated into modules and follow the same grouping used in {http://sphere-engine.com/services the SphereEngine API Documentation}.
    module API
      include SphereEngine::REST::Access
      include SphereEngine::REST::Languages
      include SphereEngine::REST::Compilers
      include SphereEngine::REST::Submissions
    end
  end
end
