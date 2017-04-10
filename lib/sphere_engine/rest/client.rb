require 'sphere_engine/client'
require 'sphere_engine/rest/api'

module SphereEngine
  module REST
    class Client < SphereEngine::Client
       include SphereEngine::REST::API
    end
  end
end