module SphereEngine
  module REST
    module Languages
      include SphereEngine::REST::Utils

      def all_languages
        perform_get_requests_of_compílers_service('/languages')
      end
    end
  end
end